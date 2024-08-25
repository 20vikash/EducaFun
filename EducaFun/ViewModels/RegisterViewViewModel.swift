//
//  RegisterViewViewModel.swift
//  EducaFun
//
//  Created by Vikash on 24/08/24.
//

import Foundation
import Combine

class RegisterViewViewModel: ObservableObject {
    @Published var fullName = ""
    @Published var userName = ""
    @Published var password = ""
    @Published var showToast = false
    
    @Published var errorMessage = ""
    @Published var isLoading = false
    @Published var successfulRegister = false
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        
    }
    
    private func handleOutput(output: URLSession.DataTaskPublisher.Output) throws -> Data {
        guard let response = output.response as? HTTPURLResponse,
              response.statusCode >= 200 && response.statusCode < 300 else {
            throw URLError(.badServerResponse)
        }
        return output.data
    }
    
    private func validateUserInput() -> Bool {
        if fullName.trimmingCharacters(in: .whitespaces).isEmpty || userName.trimmingCharacters(in: .whitespaces).isEmpty || password.trimmingCharacters(in: .whitespaces).isEmpty {
            errorMessage = "Please provide valid data"
            showToast = true
            isLoading = false
            return false
        }
        
        if fullName.count < 6 {
            errorMessage = "Full name should not be less than 6 characters"
            showToast = true
            isLoading = false
            return false
        }
        
        if userName.count < 6 {
            errorMessage = "User name should not be less than 6 characters"
            showToast = true
            isLoading = false
            return false
        }
        
        return true
    }
    
    func registerUser() {
        isLoading = true
        
        if !validateUserInput() {
            return
        }
        
        guard let url = URL(string: "https://apiep.zeal.wtf/v1/users") else {
            errorMessage = "Something went wrong.. Try again"
            showToast = true
            isLoading = false
            return
        }
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let user = UserModel(fullname: fullName, username: userName, password: password)
        
        guard let httpBody = try? JSONEncoder().encode(user) else {
            errorMessage = "Something went wrong.. Try again"
            showToast = true
            isLoading = false
            return
        }
        
        request.httpBody = httpBody
        
        URLSession.shared.dataTaskPublisher(for: request)
            .receive(on: DispatchQueue.main)
            .tryMap(handleOutput)
            .sink { [weak self] completion in
                self?.isLoading = false
                
                switch completion {
                case .finished:
                    print("User created")
                case .failure(let error):
                    self?.errorMessage = "Something went wrong.. Try again"
                    self?.showToast = true
                    self?.isLoading = false

                    print("Failed \(error)")
                }
            } receiveValue: { [weak self] returnedData in
                print("From view model")
                self?.successfulRegister = true
                self?.userName = ""
                self?.fullName = ""
                self?.password = ""
                print("Post created")
            }
            .store(in: &cancellables)
    }
}
