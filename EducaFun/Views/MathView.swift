//
//  MathView.swift
//  EducaFun
//
//  Created by Meerthika S R on 08/09/24.
//

import SwiftUI
struct MathView: View {
    @Binding var isPresented: Bool  // Binding to control presentation

    var body: some View {
        ZStack{
            
            VStack{
                VStack{
                    Text("Maths")
                        .font(.system(size: 35))
                        .bold()
                        .quizhighlighted()
                    Spacer()
                    Spacer()
                    Text("")
                }
                
            }
            VStack(spacing: 15){
                Text("1. Question is this which is the hoighest thunf in the entire worls i uia iaihfab iafbafgd uiafabavdhyfayfaiuug")
                    .padding()
                    .questionshowed()
                VStack(spacing: 10){
                    Text("A - Hello")
                        .scorepadded()
                    Text("B- Hello")
                        .scorepadded()
                    Text("A - Hello")
                        .scorepadded()
                    Text("B- Hello")
                        .scorepadded()
                }
                .padding(.trailing, 70)
            }
            .padding(.bottom, 170)
            //Back BUTTOM
            
            .navigationBarItems(leading: Button(action: {
                isPresented = false  // Dismiss the full-screen cover
            }) {
                Text("Back")
                    .font(.headline)
            })
        }
    }
}


#Preview{
    MathView(isPresented: .constant(false))
}

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

extension View{
  func questionpadded() -> some View{
      modifier(questionpad())
  }
}

struct questionshow: ViewModifier{
  func body (content: Content) -> some View{
      content
          .multilineTextAlignment(.center)
          .foregroundColor(.black)
          .font(.system(size: 15))
          .frame(width:350, height:80)
          .background(Color(.white))
          .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
          .shadow(radius: 0.5)
          
      }
}

extension View{
  func questionshowed() -> some View{
      modifier(questionshow())
  }
}

struct answerpad: ViewModifier{
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
