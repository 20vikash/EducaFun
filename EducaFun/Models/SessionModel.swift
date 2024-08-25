//
//  SessionModel.swift
//  EducaFun
//
//  Created by Vikash on 24/08/24.
//

import Foundation

// For encoding
struct SessionUser: Codable {
    let username: String
    let password: String
}

// For decoding
struct Session: Codable {
    let data: DataClass

    enum CodingKeys: String, CodingKey {
        case data = "Data"
    }
}

struct DataClass: Codable {
    let sessionID: Int
    let accessToken: String
    let accessTokenExpiresIn: Double
    let refreshToken: String
    let refreshTokenExpiresIn: Double

    enum CodingKeys: String, CodingKey {
        case sessionID = "session_id"
        case accessToken = "access_token"
        case accessTokenExpiresIn = "access_token_expires_in"
        case refreshToken = "refresh_token"
        case refreshTokenExpiresIn = "refresh_token_expires_in"
    }
}
