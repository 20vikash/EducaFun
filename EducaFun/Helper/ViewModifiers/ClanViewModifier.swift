//
//  ClanViewModifier.swift
//  EducaFun
//
//  Created by Meerthika S R on 10/09/24.
//

import SwiftUI

struct clanhighlight: ViewModifier{
    func body (content: Content) -> some View{
        content
            .padding(.leading, 10)
            .padding(.trailing, 10)
            .background(Color(customyellow).opacity(0.9))
            .clipShape(.capsule)
        
    }
}


struct clanpad: ViewModifier{
   func body (content: Content) -> some View{
       content
           .multilineTextAlignment(.trailing)
           .font(.system(size: 15))
           .frame(width:290, height:50)
           .background(Color.white)
           .clipShape(.rect(cornerRadius: 65))
           .shadow(radius: 0.5)
           
       }
}

struct joinText: View{
    var text:String
    var body: some View{
        Text(text)
            .frame(width: 40, height: 5)
            .font(.system(size: 14))
            .bold()
            .padding()
            .foregroundStyle(.black)
            .background(Color(customgreen).opacity(0.8))
            .clipShape(.rect(cornerRadius: 20))
        
        }
}

