//
//  HomeViewModel.swift
//  EducaFun
//
//  Created by Meerthika S R on 07/09/24.
//

import SwiftUI

class HomeViewModel: ObservableObject{
    @Published var name = "Meerthika"
    @Published var profilepic = ""
    @Published var rank = 10000
    @Published var medals = ["Beginner", "Intermediate", "Advanced", "Legend", "Master"]
    @Published var nextpage = ""
    
    
    init(){
    }
    
    
}
