//
//  MathViewExtensions.swift
//  EducaFun
//
//  Created by Meerthika S R on 11/09/24.
//

import SwiftUI

extension View{
  func questionpadded() -> some View{
      modifier(questionpad())
  }
}


extension View{
  func questionshowed() -> some View{
      modifier(questionshow())
  }
}


extension View{
  func answerpadded() -> some View{
      modifier(answerpad())
  }
}
