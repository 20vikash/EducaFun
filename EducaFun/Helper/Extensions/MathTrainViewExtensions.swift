//
//  MathTrainViewExtensions.swift
//  EducaFun
//
//  Created by Meerthika S R on 11/09/24.
//

import SwiftUI

extension View{
  func questionformpadded() -> some View{
      modifier(questionformpad())
  }
}



extension View{
  func answerformpadded() -> some View{
      modifier(answerformpad())
  }
}



extension View{
  func mathnextquestioned() -> some View{
      modifier(mathnextques())
  }
}

extension View{
    func optionansweformpadded() -> some View{
        modifier(optionanswerformpad())
    }
}
