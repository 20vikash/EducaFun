//
//  QuizView.swift
//  EducaFun
//
//  Created by Meerthika S R on 07/09/24.
//

import SwiftUI

struct QuizView: View {
    @State var subjects = ["Maths", "Vocabulary", "Science", "Economics"]
    @State private var showPicker = false
    @State var subject = ""
    @State var gamestatus = "Win"
    @State var topscore = 700
    @State var currentscore = 100
    @StateObject var homevm = HomeViewModel()
    var body: some View {
        NavigationStack{
            ZStack{
                RadialGradient(stops: [
                    .init(color: Color(red: 1.2, green: 1.5, blue: 1.3), location: 0.35),
                    .init(color: Color(red: 1.1, green: 1.0, blue: 0.16), location: 0.35),
                ], center: .trailing, startRadius: 100, endRadius: 1000)
                .ignoresSafeArea()
                
                VStack{
                    Text("Quiz")
                        .foregroundStyle(.black)
                        .bold()
                        .font(.system(size: 55))
                    Text("Let's Play!")
                        .quizhighlighted()
                    Spacer()
                    
                }
                
                VStack{
                    VStack{
                        Image("\(homevm.userimg)")
                            .frame(width: 130, height: 150)
                            .quizuserimaged()
                            .padding(.bottom, 20)
                        Text("Rank: \(homevm.rank)")
                            .scorepadded()
                        Text("Top Score: \(topscore)")
                            .scorepadded()
                        Text("Current Score: \(currentscore)")
                            .scorepadded()
                        HStack{
                            Image("\(homevm.usermedal)")
                                .resizable()
                                .frame(width: 90, height: 90)
                                .padding(.trailing, 40)
                            quizcapsuleText(text: "Last Game: \(gamestatus)")
                        }
                    }
                    
                }
                .frame(maxWidth :330, maxHeight: 400)
                .background(Color(customblue).opacity(0.3))
                .clipShape(.rect(cornerRadius: 90))
                .padding(.horizontal)
                .padding(.bottom, 100)
                
                VStack(spacing: -40){
                    Button(action: {
                        showPicker.toggle()
                    }) {
                        VStack(spacing: -50){
                            Text("MatchMaker")
                                .foregroundStyle(.black)
                                .font(.system(size: 15))
                                .padding(.top, 50)
                                .bold()
                            Image("Matchmaker")
                                .resizable()
                                .frame(width: 250, height: 250)
                                .ignoresSafeArea()
                        }
                    }
                    VStack{
                        if showPicker{
                            VStack{
                                Picker("Select", selection: $subject){
                                    ForEach (subjects , id: \.self){ option in
                                        Text(option)
                                            .foregroundStyle(.black)
                                    }
                                }
                                .pickerStyle(MenuPickerStyle())
                            }
                        }
                        
                    }
                    .background(Color(customyellow).opacity(0.5))
                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                    
                }
                .padding(.top, 500)
                
            }
        }
    }
}

#Preview {
    QuizView()
}

struct scorepad: ViewModifier{
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
extension View{
  func scorepadded() -> some View{
      modifier(scorepad())
  }
}

struct quizuserimage: ViewModifier{
    func body (content: Content) -> some View{
        content
            .clipShape(Circle())
            .overlay(
                Circle()
                    .stroke(Color(customblue).opacity(0.6), lineWidth: 7)
            )
        //Image Position
            .shadow(radius: 5)
            .frame(width:100, height: 100)
        
    }
}

extension View{
  func quizuserimaged() -> some View{
      modifier(quizuserimage())
  }
}

struct quizcapsuleText: View{
    var text:String
    var body: some View{
        Text(text)
            .font(.system(size: 13))
            .bold()
            .padding()
            .foregroundStyle(.black)
            .background(Color(customyellow).opacity(0.8))
            .clipShape(.rect(cornerRadius: 30))
        
        }
}

struct quizhighlight: ViewModifier{
    func body (content: Content) -> some View{
        content
            .padding(.leading, 10)
            .padding(.trailing, 10)
            .background(Color(customyellow).opacity(0.9))
            .clipShape(.capsule)
            .font(.system(size: 19))
            .padding(.bottom, 405)
            .font(.system(size: 20))
        
    }
}
extension View{
  func quizhighlighted() -> some View{
      modifier(quizhighlight())
  }
}
