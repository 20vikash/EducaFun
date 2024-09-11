//
//  VocabTrainViewModel.swift
//  EducaFun
//
//  Created by Meerthika S R on 11/09/24.
//

import SwiftUI

class VocabTrainViewModel: ObservableObject{
    @Published var vocabquestion: String = ""
    @Published var vocaboptions: [String] = Array(repeating: "", count: 4)
    
    init(){
        
    }
}

