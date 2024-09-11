//
//  VocabViewModifiers.swift
//  EducaFun
//
//  Created by Meerthika S R on 11/09/24.
//

import SwiftUI

struct vocabhighlight: ViewModifier{
    func body (content: Content) -> some View{
        content
            .padding(.leading, 10)
            .padding(.trailing, 10)
            .background(Color(customviolet).opacity(0.5))
            .clipShape(.capsule)
            .font(.system(size: 19))
            .padding(.bottom, 405)
            .font(.system(size: 20))
        
    }
}

struct vocabTimertext: View{
    var text:String
    var body: some View{
        Text(text)
            .font(.system(size: 14))
            .bold()
            .padding()
            .foregroundStyle(.black)
            .background(Color(customviolet).opacity(0.5))
            .clipShape(.rect(cornerRadius: 20))
        
        }
}
