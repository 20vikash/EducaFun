//
//  QuizView.swift
//  EducaFun
//
//  Created by Meerthika S R on 07/09/24.
//

import SwiftUI
import AlertToast

struct QuizView: View {
    @State private var showPicker = false
    @State private var showFullScreenVocabView = false
    @State private var showFullScreenMathView = false
    @StateObject var quizvm = QuizViewModel()
    @StateObject var homevm = HomeViewModel()
    
    @StateObject var socketManager = SocketIOManager()
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
                        Text("Top Score: \(quizvm.topscore)")
                            .scorepadded()
                        Text("Current Score: \(quizvm.currentscore)")
                            .scorepadded()
                        HStack{
                            Image("\(homevm.usermedal)")
                                .resizable()
                                .frame(width: 90, height: 90)
                                .padding(.trailing, 40)
                            quizcapsuleText(text: "Last Game: \(quizvm.gamestatus)")
                        }
                    }
                    
                }
                .frame(maxWidth :330, maxHeight: 400)
                .background(Color(customblue).opacity(0.3))
                .clipShape(.rect(cornerRadius: 90))
                .padding(.horizontal)
                .padding(.bottom, 100)
                //change to 60
                VStack(spacing: -60){
                    Button(action: {
                        quizvm.isSheet = true
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
                    .sheet(isPresented: $quizvm.isSheet) {
                        NavigationStack{
                            VStack(spacing: -10) {
                                Text("Select the Subject")
                                    .font(.title2)
                                    .background(Color(customyellow).opacity(0.9))
                                    .clipShape(.capsule)
                                    .padding(.bottom, 10)
                                HStack(spacing: -23) {
                                    ForEach(0..<4) { number in
                                        Button{
                                            socketManager.isLoading = true
                                            quizvm.selectedSubject = number
                                            
                                            socketManager.matchMaking(data: ["uid": TokenManager.getUID() ?? ""])
                                        }label:{
                                            VStack(spacing: -10) {
                                                Image(quizvm.subjects[number])
                                                    .resizable()
                                                    .frame(width: 120, height: 120)
                                                Text("\(quizvm.subjects[number])")
                                                    .bold()
                                                    .font(.system(size: 13))
                                                    .foregroundStyle(.black)
                                                    .background(Color(customblue).opacity(0.3))
                                                    .clipShape(Capsule())
                                            }
                                        }
                                        .fullScreenCover(isPresented: $showFullScreenMathView) {
                                            NavigationStack {
                                                MathView(isPresented: $showFullScreenMathView)
                                            }
                                        }
                                        
                                        .fullScreenCover(isPresented: $showFullScreenVocabView) {
                                            NavigationStack {
                                                VocabView(isPresented: $showFullScreenVocabView)
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        .presentationDetents([.fraction(0.3)])
                        
                    }
                }
                .padding(.top, 500)
            }
            .toast(isPresenting: $socketManager.isLoading) {
                AlertToast(type: .loading, title: "Match making.....")
            }
            .onReceive(socketManager.$isLoading, perform: { loading in
                if !loading {
                    if (quizvm.selectedSubject == 0) {
                        showFullScreenMathView = true
                    } else if (quizvm.selectedSubject == 1) {
                        showFullScreenVocabView = true
                    }
                }
            })
        }
    }
}

#Preview {
    QuizView()
}
