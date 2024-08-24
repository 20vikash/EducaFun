//
//  RegisterViewViewModel.swift
//  EducaFun
//
//  Created by Vikash on 24/08/24.
//

import Foundation

class RegisterViewViewModel: ObservableObject {
    @Published var fullName = ""
    @Published var userName = ""
    @Published var password = ""
    
    init() {
        
    }
}
