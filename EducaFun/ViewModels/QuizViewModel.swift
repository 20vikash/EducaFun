//
//  QuizViewModel.swift
//  EducaFun
//
//  Created by Meerthika S R on 09/09/24.
//

import SwiftUI

class QuizViewModel: ObservableObject{
    @Published var selectedSubject: Int? = nil
    @Published var isSheet = false
    @Published var subjects = ["Maths", "Vocabulary", "Science", "Economics"]
    @Published var subject = ""
    @Published var gamestatus = "Win"
    @Published var topscore = 700
    @Published var currentscore = 100

    
    init(){
        
    }
}
