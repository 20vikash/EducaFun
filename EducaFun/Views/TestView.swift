//
//  TestView.swift
//  EducaFun
//
//  Created by Vikash on 24/08/24.
//

import SwiftUI

struct TestView: View {
    var body: some View {
        Button {
//            print(TokenManager.getAccessToken() ?? "No")
//            print(TokenManager.getRefreshToken() ?? "No")
//            print(TokenManager.getRefreshTokenExpiry() ?? "No")
//            print(TokenManager.getAccessTokenExpiry() ?? "No")
            
            TokenManager.clearAll()
        } label: {
            Text("Hi")
        }
    }
}

#Preview {
    TestView()
}
