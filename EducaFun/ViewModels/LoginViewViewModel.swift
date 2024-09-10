//
//  LoginViewViewModel.swift
//  EducaFun
//
//  Created by Vikash on 24/08/24.
//

import Foundation
import Combine

class LoginViewViewModel: ObservableObject {
    @Published var userName = ""
    @Published var password = ""
    
    @Published var isLoading = false
    @Published var canNavigate = false
    
    @Published var errorMessage = ""
    @Published var errorToast = false
    
    var cancellables = Set<AnyCancellable>()
    
    init() {
        
    }
    
    private func handleOutput(output: URLSession.DataTaskPublisher.Output) throws -> Data {
        guard let response = output.response as? HTTPURLResponse else {
            throw URLError(.badServerResponse)
        }
        
        guard response.statusCode >= 200 && response.statusCode < 300 else {
            throw URLError(.badServerResponse)
        }
        
        return output.data
    }
    
    func validateUserInput() -> Bool{
        if userName.trimmingCharacters(in: .whitespaces).isEmpty || password.trimmingCharacters(in: .whitespaces).isEmpty {
            errorMessage = "Please provide valid data"
            errorToast = true
            isLoading = false
            return false
        }
        return true
    }
    
    func login() {
        isLoading = true
        
        if !validateUserInput() {
            return
        }
        
        guard let url = URL(string: "https://educafunapi.zeal.lol/v1/sessions") else {
            errorMessage = "Something went wrong"
            errorToast = true
            isLoading = false
            return
        }
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let user = SessionUser(username: userName, password: password)
        
        guard let httpBody = try? JSONEncoder().encode(user) else {
            errorMessage = "Something went wrong"
            errorToast = true
            isLoading = false
            return
        }
        
        request.httpBody = httpBody
        
        URLSession.shared.dataTaskPublisher(for: request)
            .receive(on: DispatchQueue.main)
            .tryMap(handleOutput)
            .decode(type: Session.self, decoder: JSONDecoder())
            .sink { [weak self] completion in
                self?.isLoading = false
                
                switch completion {
                case .finished:
                    self?.canNavigate = true
                    print("Successfully logged in")
                case .failure(let error):
                    self?.errorMessage = "Something went wrong"
                    self?.errorToast = true
                    self?.isLoading = false
                    print("Failed \(error.localizedDescription)")
                }
            } receiveValue: { returnedData in
                TokenManager.setSessionId(returnedData.data.sessionID)
                TokenManager.setAccessToken(returnedData.data.accessToken)
                TokenManager.setRefreshToken(returnedData.data.refreshToken)
                TokenManager.setAccessTokenExpiry(returnedData.data.accessTokenExpiresIn)
                TokenManager.setRefreshTokenExpiry(returnedData.data.refreshTokenExpiresIn)
                TokenManager.setUID(returnedData.data.uid)
            }
            .store(in: &cancellables)
    }
}
