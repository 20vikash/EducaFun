//
//  HomeViewExtensions.swift
//  EducaFun
//
//  Created by Meerthika S R on 07/09/24.
//

import SwiftUI
import Foundation

extension View{
  func logoimaged() -> some View{
      modifier(logoimage())
  }
}

extension View{
  func buttoned() -> some View{
      modifier(buttons())
  }
}


extension View{
  func highlighted() -> some View{
      modifier(highlight())
  }
}

