//
//  KeychainManager.swift
//  EducaFun
//
//  Created by Vikash on 24/08/24.
//

import Foundation
import KeychainSwift

class TokenManager {
    private static let keychain = KeychainSwift()

    static func getAccessToken() -> String? {
        keychain.get("accessToken")
    }
    
    static func setSessionId(_ id: Int) {
        keychain.set(id.description, forKey: "id")
    }
    
    static func getSessionId() -> String? {
        keychain.get("id")
    }

    static func setAccessToken(_ token: String) {
        keychain.set(token, forKey: "accessToken")
    }

    static func getRefreshToken() -> String? {
        keychain.get("refreshToken")
    }

    static func setRefreshToken(_ token: String) {
        keychain.set(token, forKey: "refreshToken")
    }

    static func setRefreshTokenExpiry(_ seconds: Double) {
        let currentDate = Date()
        let futureDate = currentDate.addingTimeInterval(seconds)

        keychain.set(futureDate.description, forKey: "rexpiry")
    }

    static func getRefreshTokenExpiry() -> String? {
        keychain.get("rexpiry")
    }

    static func setAccessTokenExpiry(_ seconds: Double) {
        let currentDate = Date()
        let futureDate = currentDate.addingTimeInterval(seconds)

        keychain.set(futureDate.description, forKey: "aexpiry")
    }
    
    static func setUID(_ uid: Int) {
        keychain.set(uid.description, forKey: "uid")
    }
    
    static func getUID() -> String? {
        keychain.get("uid")
    }
    
    static func getAccessTokenExpiry() -> String? {
        keychain.get("aexpiry")
    }
    
    static func clearAll() {
        keychain.clear()
    }
}
