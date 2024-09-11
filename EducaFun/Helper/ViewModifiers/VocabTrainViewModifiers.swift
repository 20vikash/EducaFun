//
//  VocabTrainViewModifiers.swift
//  EducaFun
//
//  Created by Meerthika S R on 11/09/24.
//

import SwiftUI

struct vocabnextques: ViewModifier{
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
               .background(.green)
           .cornerRadius(50)
           
       }
}
