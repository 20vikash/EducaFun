//
//  MathView.swift
//  EducaFun
//
//  Created by Meerthika S R on 08/09/24.
//

import SwiftUI
struct MathView: View {
    @Binding var isPresented: Bool// Binding to control presentation
    @State var options = ["A", "B", "C", "D"]

    var body: some View {
        ZStack{

            ZStack {
                // Circle with background color
                Circle()
                    .fill(Color.black)
                    .frame(width: 70, height: 70)
                Text("1")
                    .foregroundColor(.white)
                    .font(.system(size: 30))
                    .bold()
            }
            .padding(.bottom, 550)
            .padding(.trailing, 280)

                
                capsuleText(text: "Timer: 00:00")
                //Should IMplement timer
                    .padding(.bottom, 540)
                    .padding(.leading, 250)
            VStack{
                VStack{
                    VStack{
                        Text("Maths")
                            .font(.system(size: 35))
                            .bold()
                            .quizhighlighted()
                        Spacer()
                        Spacer()
                    }
                    VStack{
                        Button{
                            //Movve to Next Question -- only changong question
                        }label:{
                            Text("Next Question")
                                .bold()
                                .foregroundStyle(.black)
                                .frame(width: 260, height: 70)
                                .clipShape(Capsule())
                                    .overlay(
                                        Capsule()
                                            .stroke(Color.black.opacity(0.7), lineWidth: 7)
                                    )
                                .background(Color(customyellow))
                                .cornerRadius(50)
                            
                        }
                    }
                    .padding(.bottom, 70)
                }
                
            }
            ZStack{
                Rectangle()
                    .fill(Color(customyellow).opacity(0.3))
                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
            }
            .padding(.top, 150)
            .padding(.bottom, 200)
            VStack(spacing: 25){
                Text("1. Question is this which is the in the enti")
                    .padding()
                    .questionshowed()
                    VStack{
                        
                        ForEach(0..<4){
                            number in
                            Button{
                                
                            }label:{
                                Text(options[number])
                                    .answerpadded()
                                
                            }
                            
                        }
                    }
            }
            .padding(.top, 170)
            
            //Back BUTTOM
            .padding(.bottom, 200)
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
          .frame(width:350, height:85)
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
          .multilineTextAlignment(.center)
          .foregroundColor(.black)
          .font(.system(size: 15))
          .frame(width:250, height:40)
          .background(Color(.white))
          .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
          .shadow(radius: 0.5)
          
      }
}

extension View{
  func answerpadded() -> some View{
      modifier(answerpad())
  }
}



