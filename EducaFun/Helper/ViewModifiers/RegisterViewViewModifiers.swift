//
//  RegisterViewViewModifiers.swift
//  EducaFun
//
//  Created by Vikash on 24/08/24.
//

import Foundation
import SwiftUI

struct registerpad: ViewModifier{
  func body (content: Content) -> some View{
      content
          .multilineTextAlignment(.center)
          .foregroundColor(.black)
          .font(.system(size: 15))
          .frame(width:290, height:50)
          .background(Color(.white))
          .border(Color.black, width:1)
          .shadow(radius: 0.5)
          
      }
}



