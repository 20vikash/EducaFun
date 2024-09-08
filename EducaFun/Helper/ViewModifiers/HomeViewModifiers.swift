//
//  HomeViewModifiers.swift
//  EducaFun
//
//  Created by Meerthika S R on 07/09/24.
//

import SwiftUI
import Foundation

struct logoimage: ViewModifier{
    func body (content: Content) -> some View{
        content
            .clipShape(Circle())
            .overlay(
                Circle()
                    .stroke(Color(customblue).opacity(0.6), lineWidth: 7)
            )
        //Image Position
            .padding()
            .padding(.trailing, -30)
            .shadow(radius: 5)
            .frame(width:100, height: 50)
        
    }
}


struct buttons: ViewModifier{
    func body (content: Content) -> some View{
        content
            .frame(width: 220, height:220)
            .padding()
            .padding(.trailing, -30)
            .shadow(radius: 5)
    }
}
struct highlight: ViewModifier{
    func body (content: Content) -> some View{
        content
            .padding(.leading, 10)
            .padding(.trailing, 10)
            .background(Color(customyellow).opacity(0.9))
            .clipShape(.capsule)
            .font(.system(size: 19))
            .padding(.bottom, 405)
            .padding(.trailing, 30)
            .font(.system(size: 20))
        
    }
}
//CapsuleText -- No extension

struct capsuleText: View{
    var text:String
    var body: some View{
        Text(text)
            .font(.system(size: 14))
            .bold()
            .padding()
            .foregroundStyle(.black)
            .background(Color(customyellow).opacity(0.8))
            .clipShape(.rect(cornerRadius: 20))
        
        }
}
