//
//  LoginViewViewModel.swift
//  EducaFun
//
//  Created by Vikash on 24/08/24.
//

import Foundation

class LoginViewViewModel: ObservableObject {
    @Published var showSheet = false
    @Published var userName = ""
    @Published var password = ""
    
    init() {
        
    }
}
