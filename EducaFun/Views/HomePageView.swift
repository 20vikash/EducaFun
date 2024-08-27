//
//  HomePageView.swift
//  EducaFun
//
//  Created by Vikash on 24/08/24.
//

import SwiftUI

struct HomePageView: View{
    //Here Hashable was there
    @State private var name = "Meerthika"
    @State private var profilepic = ""
    @State private var rank = 1
    @State var medals = ["gold", "bronze", "silver", "Diamond"]
    var body: some View {
        ZStack(){
            Rectangle()
                .fill(customyellow)
            HStack{
                Text("Hello \n**\(name)**!")
                    .font(.system(size: 35))
                    .offset(x:15, y:-260)
                    .frame(width:200, height:170)
                //Image
                Image("educafun logo")
                    .frame(width: 150, height: 220)
                    .imaged()
                Spacer()
                
            }
            VStack{
                //Rank Identification
                HStack(spacing: 0){
                    capsuleText(text: "Rank: \(rank)")
                        .frame(height:10, alignment: .trailing)
                        .offset(x: 40, y:-160)
                        .shadow(radius: 5)
                    
                    //Medal stars can change can
                    Image("gold")
                        .resizable()
                        .frame(width: 90, height: 90)
                        .offset(x:-170, y: -163)
                }
                .padding()
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    HomePageView()
}

struct image: ViewModifier{
    func body (content: Content) -> some View{
        content
            .clipShape(Circle())
            .overlay(
                Circle()
                    .stroke(Color(customblue), lineWidth: 7)
            )
        //Image Position
            .offset(x:50, y:-270)
            .shadow(radius: 5)
            .frame(width:100, height: 50)
        
    }
}

extension View{
  func imaged() -> some View{
      modifier(image())
  }
}

struct capsuleText: View{
    var text:String
    var body: some View{
        Text(text)
            .font(.system(size: 14))
            .bold()
            .padding()
            .foregroundStyle(.white)
            .background(Color(customblue).opacity(0.9))
            .clipShape(.capsule)
        
        }
}

