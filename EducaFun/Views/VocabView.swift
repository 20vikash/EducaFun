//
//  VocabView.swift
//  EducaFun
//
//  Created by Meerthika S R on 09/09/24.
//

import SwiftUI

struct VocabView: View {
    @Binding var isPresented: Bool  // Binding to control presentation
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

                
                vocabTimertext(text: "Timer: 00:00")
                //Should IMplement timer
                    .padding(.bottom, 540)
                    .padding(.leading, 250)
            VStack{
                VStack{
                    VStack{
                        Text("Vocabulary")
                            .font(.system(size: 35))
                            .bold()
                            .vocabhighlighted()
                        
                        Spacer()
                        Spacer()
                    }
                    VStack{
                        Button{
                            
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
                                .background(Color(customviolet).opacity(0.5))
                                .cornerRadius(50)
                            
                        }
                    }
                    .padding(.bottom, 70)
                }
                
            }
            ZStack{
                Rectangle()
                    .fill(Color(customviolet).opacity(0.3))
                    .border(Color.black)
            }
            .padding(.top, 150)
            .padding(.bottom, 200)
            VStack(spacing: 25){
                Text("1. Question is this which is the hoighest thunf in the entire worls i uia iaihfab iafbafgd uiafabavdhyfayfaiuug")
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
    VocabView(isPresented: .constant(false))
}

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

extension View{
  func vocabhighlighted() -> some View{
      modifier(vocabhighlight())
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
