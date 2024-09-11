//
//  TrainTroopsViewExtensions.swift
//  EducaFun
//
//  Created by Meerthika S R on 11/09/24.
//

import SwiftUI


extension View{
  func troophighlighted() -> some View{
      modifier(troophighlight())
  }
}



extension View{
  func troopimaged() -> some View{
      modifier(troopimage())
  }
}



extension View{
  func justhighlighted() -> some View{
      modifier(justhighlight())
  }
}
