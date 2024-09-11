//
//  MathViewModifiers.swift
//  EducaFun
//
//  Created by Meerthika S R on 11/09/24.
//

import SwiftUI

struct questionpad: ViewModifier{
    func body (content: Content) -> some View{
        content
            .frame(maxWidth :400, maxHeight: 800)
            .background(Color(customblue).opacity(0.3))
            .clipShape(.rect(cornerRadius: 90))
            .padding(.horizontal)
            .padding(.bottom,-100)
        
    }
}

struct questionshow: ViewModifier{
  func body (content: Content) -> some View{
      content
          .multilineTextAlignment(.center)
          .foregroundColor(.black)
          .font(.system(size: 15))
          .frame(width:350, height:85)
          .background(Color(.white))
          .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
          .shadow(radius: 0.5)
          
      }
}

struct answerpad: ViewModifier{
  func body (content: Content) -> some View{
      content
          .multilineTextAlignment(.center)
          .foregroundColor(.black)
          .font(.system(size: 15))
          .frame(width:250, height:40)
          .background(Color(.white))
          .border(Color.black)
          .shadow(radius: 0.5)
          
      }
}

struct optionanswerformpad: ViewModifier{
   func body (content: Content) -> some View{
       content
           .multilineTextAlignment(.center)
           .font(.system(size: 15))
           .frame(width:50, height:50)
           .background(Color.white)
           .clipShape(Capsule())
               .overlay(
                   Capsule()
                    .stroke(.black.opacity(0.6), lineWidth: 3)
                    
               )
           
       }
}
