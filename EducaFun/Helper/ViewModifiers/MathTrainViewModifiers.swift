//
//  MathTrainViewModifiers.swift
//  EducaFun
//
//  Created by Meerthika S R on 11/09/24.
//

import SwiftUI

struct questionformpad: ViewModifier{
   func body (content: Content) -> some View{
       content
           .multilineTextAlignment(.leading)
           .font(.system(size: 15))
           .frame(width:370, height:85)
           .background(Color.white)
           .clipShape(Capsule())
               .overlay(
                   Capsule()
                    .stroke(.black.opacity(0.6), lineWidth: 2)
               )
           
       }
}

struct answerformpad: ViewModifier{
   func body (content: Content) -> some View{
       content
           .multilineTextAlignment(.center)
           .font(.system(size: 15))
           .frame(width:370, height:50)
           .background(Color.white)
           .clipShape(Capsule())
               .overlay(
                   Capsule()
                    .stroke(.black.opacity(0.6), lineWidth: 2)
               )
           
       }
}

struct mathnextques: ViewModifier{
   func body (content: Content) -> some View{
       content
           .bold()
           .foregroundStyle(.black)
           .frame(width: 260, height: 70)
           .clipShape(Capsule())
               .overlay(
                   Capsule()
                       .stroke(Color.black.opacity(0.7), lineWidth: 7)
               )
               .background(.gray)
           .cornerRadius(50)
           
       }
}
