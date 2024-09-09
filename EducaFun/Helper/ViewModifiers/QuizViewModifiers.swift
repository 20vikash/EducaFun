//
//  QuizViewModifiers.swift
//  EducaFun
//
//  Created by Meerthika S R on 09/09/24.
//

import SwiftUI
import Foundation


struct scorepad: ViewModifier{
  func body (content: Content) -> some View{
      content
          .multilineTextAlignment(.trailing)
          .foregroundColor(.black)
          .font(.system(size: 12))
          .frame(width:250, height:30)
          .background(Color(.white))
          .clipShape(Capsule())
              .overlay(
                  Capsule()
                    .stroke(Color(customblue).opacity(0.6), lineWidth: 3)
              )
          .shadow(radius: 0.5)
          
      }
}

struct quizuserimage: ViewModifier{
    func body (content: Content) -> some View{
        content
            .clipShape(Circle())
            .overlay(
                Circle()
                    .stroke(Color(customblue).opacity(0.6), lineWidth: 7)
            )
        //Image Position
            .shadow(radius: 5)
            .frame(width:100, height: 100)
        
    }
}

struct quizcapsuleText: View{
    var text:String
    var body: some View{
        Text(text)
            .font(.system(size: 13))
            .bold()
            .padding()
            .foregroundStyle(.black)
            .background(Color(customyellow).opacity(0.8))
            .clipShape(.rect(cornerRadius: 30))
        
        }
}

struct quizhighlight: ViewModifier{
    func body (content: Content) -> some View{
        content
            .padding(.leading, 10)
            .padding(.trailing, 10)
            .background(Color(customyellow).opacity(0.9))
            .clipShape(.capsule)
            .font(.system(size: 19))
            .padding(.bottom, 405)
            .font(.system(size: 20))
        
    }
}

struct container: ViewModifier{
    func body (content: Content) -> some View{
        content
            .frame(maxWidth :90, maxHeight: 90)
            .background(Color(customblue).opacity(0.3))
            .clipShape(.rect(cornerRadius: 90))
            .padding(.horizontal)
            .padding(.bottom, 100)
    }
}
