//
//  RefreshTokenModel.swift
//  EducaFun
//
//  Created by Vikash on 24/08/24.
//

import Foundation

struct RefreshTokenModel: Codable {
    let refreshToken: String
    
    enum CodingKeys: String, CodingKey {
        case refreshToken = "refresh_token"
    }
}
