//
//  ContentViewViewModel.swift
//  EducaFun
//
//  Created by Vikash on 24/08/24.
//

import Foundation
import Combine

class ContentViewViewModel: ObservableObject {
    private var accessTokenActive = false
    private var refreshTokenActive = false
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {

    }
    
    func isTokenActive(expiryString: String?, tokenFlag: String) {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss Z"
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        
        if let dateFromString = dateFormatter.date(from: expiryString ?? "") {
            let currentDate = Date()

            if dateFromString > currentDate {
                if tokenFlag == "access" {
                    accessTokenActive = true
                } else if tokenFlag == "refresh" {
                    refreshTokenActive = true
                }
            } else if dateFromString < currentDate {
                if tokenFlag == "refresh" {
                    accessTokenActive = false
                } else if tokenFlag == "refresh" {
                    refreshTokenActive = false
                }
            }
        } else {
            print("Failed to convert the date string into a Date object.")
        }
    }
    
    func isAuthenticated() -> Bool {
        let accessTokenExpiry = TokenManager.getAccessTokenExpiry()
        let refreshTokenExpiry = TokenManager.getRefreshTokenExpiry()
        
        isTokenActive(expiryString: accessTokenExpiry, tokenFlag: "access")
        isTokenActive(expiryString: refreshTokenExpiry, tokenFlag: "refresh")
        
        if (accessTokenActive) {
            return true
        }
        else if (!accessTokenActive && !refreshTokenActive) {
            return false
        }
        
        else if (!accessTokenActive && refreshTokenActive) {
            refreshToken()
            return true
        }
        else {
            return false
        }
    }
    
    private func handleOutput(output: URLSession.DataTaskPublisher.Output) throws -> Data {
        guard let response = output.response as? HTTPURLResponse,
              response.statusCode >= 200 && response.statusCode < 300 else {
            throw URLError(.badServerResponse)
        }
        return output.data
    }
    
    func refreshToken() {
        let sessionId = TokenManager.getSessionId()
        let refreshToken = TokenManager.getRefreshToken()
        
        guard let url = URL(string: "https://apiep.zeal.wtf/v1/sessions/\(sessionId ?? "")") else {
            return
        }
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "PATCH"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(TokenManager.getAccessToken(), forHTTPHeaderField: "Authorization")
        
        let refresh = RefreshTokenModel(refreshToken: refreshToken ?? "")
        
        guard let httpBody = try? JSONEncoder().encode(refresh) else {
            return
        }
        
        request.httpBody = httpBody
        
        URLSession.shared.dataTaskPublisher(for: request)
            .receive(on: DispatchQueue.main)
            .tryMap(handleOutput)
            .decode(type: Session.self, decoder: JSONDecoder())
            .sink { completion in
                
                switch completion {
                case .finished:
                    print("Successfully logged in")
                case .failure(let error):
                    print("Failed \(error.localizedDescription)")
                }
            } receiveValue: { returnedData in
                TokenManager.setSessionId(returnedData.data.sessionID)
                TokenManager.setAccessToken(returnedData.data.accessToken)
                TokenManager.setRefreshToken(returnedData.data.refreshToken)
                TokenManager.setAccessTokenExpiry(returnedData.data.accessTokenExpiresIn)
                TokenManager.setRefreshTokenExpiry(returnedData.data.refreshTokenExpiresIn)
            }
            .store(in: &cancellables)
    }
}
