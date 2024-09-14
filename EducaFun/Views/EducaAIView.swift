//
//  EducaAIView.swift
//  EducaFun
//
//  Created by Meerthika S R on 07/09/24.
//

//
//  MathView.swift
//  EducaFun
//
//  Created by Meerthika S R on 08/09/24.
//

//
//  EducaAIView.swift
//  EducaFun
//
//  Created by Meerthika S R on 07/09/24.
//

//
//  MathView.swift
//  EducaFun
//
//  Created by Meerthika S R on 08/09/24.
//

import SwiftUI
struct EducaAIView: View {
    @StateObject var mathvw = MathViewModel()
    var body: some View {
        ZStack{
            
            RadialGradient(stops: [
                .init(color: Color(red: 0.9, green: 0.9, blue: 0.9), location: 0.01),
                .init(color: Color(red: 0.7, green: 0.9, blue: 0.94), location: 0.3),
            ], center: .center, startRadius: 100, endRadius: 1000)
            
            .ignoresSafeArea()
                AIcapsuleText(text: "Points: ")
                //Should IMplement timer
                    .padding(.bottom, 540)
                    .padding(.leading, 250)
            Image("robo")
                .resizable()
                .frame(width:200, height: 200)
                .padding(.bottom, 554)
                .padding(.trailing, 250)
            VStack{
                VStack{
                    VStack{
                        Text("AI QUIZ")
                            .font(.system(size: 35))
                            .bold()
                            .Aihighlighted()
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
                                .background(Color(custombestsilver))
                                .cornerRadius(50)
                            
                        }
                    }
                    .padding(.bottom, 70)
                }
                
            }
            ZStack{
                Rectangle()
                    .fill(Color(custombestsilver))
                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 2)
            }
            .padding(.top, 150)
            .padding(.bottom, 200)
            VStack(spacing: 25){
                Text("1. Question is this which is the in the entire name")
                    .padding()
                    .questionshowed()
                    VStack{
                        
                        ForEach(0..<4){
                            number in
                            Button{
                                
                            }label:{
                                Text(mathvw.optionsmath[number])
                                    .answerpadded()
                                
                            }
                            
                        }
                    }
            }
            .padding(.top, 170)
            
            //Back BUTTOM
            .padding(.bottom, 200)
        }
    }
}


#Preview{
    EducaAIView()
}



struct Aihighlight: ViewModifier{
    func body (content: Content) -> some View{
        content
            .padding(.leading, 10)
            .padding(.trailing, 10)
            .background(Color(customblue).opacity(0.3))
            .clipShape(.capsule)
            .font(.system(size: 19))
            .padding(.bottom, 405)
            .font(.system(size: 20))
        
    }
}


extension View{
  func Aihighlighted() -> some View{
      modifier(Aihighlight())
  }
}

struct AIcapsuleText: View{
    var text:String
    var body: some View{
        Text(text)
            .font(.system(size: 14))
            .bold()
            .padding()
            .foregroundStyle(.black)
            .background(Color(customblue).opacity(0.35))
            .clipShape(Rectangle())
            .cornerRadius(10)
        
        }
}

