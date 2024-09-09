//
//  QuizViewExtensions.swift
//  EducaFun
//
//  Created by Meerthika S R on 09/09/24.
//

import SwiftUI

extension View{
  func scorepadded() -> some View{
      modifier(scorepad())
  }
}



extension View{
  func quizuserimaged() -> some View{
      modifier(quizuserimage())
  }
}


extension View{
  func quizhighlighted() -> some View{
      self.modifier(quizhighlight())
  }
}

extension View{
  func containerized() -> some View{
      modifier(container())
  }
}
