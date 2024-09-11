//
//  TrainTroopsViewModifiers.swift
//  EducaFun
//
//  Created by Meerthika S R on 11/09/24.
//

import SwiftUI

struct troophighlight: ViewModifier{
    func body (content: Content) -> some View{
        content
            .padding(.leading, 20)
            .padding(.trailing, 20)
            .background(.black.opacity(0.9))
            .clipShape(.capsule)
        
    }
}

struct troopimage: ViewModifier{
    func body (content: Content) -> some View{
        content
            .clipShape(Circle())
            .overlay(
                Circle()
                    .stroke(Color(customblue).opacity(0.6), lineWidth: 7)
            )
        //Image Positio
            .shadow(radius: 5)
            .frame(width:200, height: 200)
        
    }
}

struct justhighlight: ViewModifier{
    func body (content: Content) -> some View{
        content
            .padding(.leading, 10)
            .padding(.trailing, 10)
            .background(Color(customyellow).opacity(0.9))
            .clipShape(.capsule)
        
    }
}
