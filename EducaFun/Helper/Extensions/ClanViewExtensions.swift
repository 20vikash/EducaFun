//
//  ClanViewExtensions.swift
//  EducaFun
//
//  Created by Meerthika S R on 10/09/24.
//

import SwiftUI

extension View{
  func clanhighlighted() -> some View{
      self.modifier(clanhighlight())
  }
}


extension View{
  func clanpadded() -> some View{
      self.modifier(clanpad())
  }
}
