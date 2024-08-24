//
//  LoginViewViewModifiers.swift
//  EducaFun
//
//  Created by Vikash on 24/08/24.
//

import Foundation
import SwiftUI

struct formpad: ViewModifier{
   func body (content: Content) -> some View{
       content
           .multilineTextAlignment(.center)
           .font(.system(size: 15))
           .frame(width:290, height:50)
           .background(Color.white)
           .clipShape(.rect(cornerRadius: 65))
           .shadow(radius: 0.5)
           
       }
}
