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
//            ZStack{
//                Image("bg")
//                    .resizable()
//            }
            Rectangle()
                .fill(customyellow.opacity(0.83))
                .ignoresSafeArea()
            VStack(spacing: -40){
                HStack{
                    Text("Hello \n**\(name)**!")
                        .font(.system(size: 35))
                        .frame(width: 200, height: 170)
                        .padding()
                    
                    //Image
                    Image("educafun logo")
                        .frame(width: 150, height: 220)
                        .imaged()
                    Spacer()
                    
                    
                }
                //Rank Identification
                HStack(spacing: 0){
                    capsuleText(text: "Rank: \(rank)")
                        .frame(height:10, alignment: .trailing)
                        .padding(.trailing, 50)
                        .padding(.bottom, 350)
                        .padding(.trailing,50)
                        .shadow(radius: 5)
                    
                    //Medal stars can change can
                    Image("Beginner")
                        .resizable()
                        .frame(width: 90, height: 90)
                        .padding(.trailing, 100)
                        .padding(.leading, -70)
                    
                        .padding(.bottom, 350)
                }
            }
            .padding(.bottom, 170)
                
            VStack{
                ZStack{
                    capsuleText(text: "What Do you want to Learn Today?")
                        .font(.system(size: 19))
                        .padding(.bottom, 370)
                        .padding(.trailing, 30)
                        .font(.system(size: 20))
                }
            }
            .frame(width: 370, height: 422)
            .padding(.vertical, 20)
            .background( ZStack {
                // Regular material background
                Color.clear.background(.regularMaterial)
                Color(customblue).opacity(0.7)
            })
            .clipShape(.rect(cornerRadius: 20))
            .padding(.top, 200)
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
                    .stroke(Color(customblue).opacity(0.6), lineWidth: 7)
            )
        //Image Position
            .padding()
            .padding(.trailing, -30)
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

