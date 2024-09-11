//
//  MathTrainViewModel.swift
//  EducaFun
//
//  Created by Meerthika S R on 11/09/24.
//

import SwiftUI

class MathTrainViewModel: ObservableObject{
    @Published var mathquestion: String = ""
    @Published var mathoptions: [String] = Array(repeating: "", count: 4)
    
    init(){
        
    }
}
