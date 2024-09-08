//
//  HomeViewModel.swift
//  EducaFun
//
//  Created by Meerthika S R on 07/09/24.
//

import SwiftUI

class HomeViewModel: ObservableObject{
    @Published var userimg = "Clans"
    @Published var profilepic = ""
    @Published var rank = 10000
    @Published var medals = ["Beginner", "Intermediate", "Advanced", "Legend", "Master"]
    @Published var usermedal = "Beginner"
    @Published var nextpage = ""
    
    
    init(){
    }
    
    
}
