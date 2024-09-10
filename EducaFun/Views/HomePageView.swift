//
//  HomePageView.swift
//  EducaFun
//
//  Created by Vikash on 24/08/24.
//

import SwiftUI

struct HomePageView: View{
    //Here Hashable was there
    let names = ["FunLab", "Quizzes", "Clan War", "EducaFun AI"]
    let imgnames = ["Funlab", "Quiz", "Clans", "EducafunAI"]
    let destinations: [AnyView] = [
        AnyView(FunLabView()), // Replace with the appropriate views
        AnyView(QuizView()),
        AnyView(ClanView()),
        AnyView(EducaAIView())
    ]
    @StateObject var loginvm = LoginViewViewModel()
    @StateObject var homevm = HomeViewModel()
    var body: some View {
        NavigationStack{
            ZStack(){
                RadialGradient(stops: [
                    .init(color: Color(red: 1.2, green: 0.9, blue: 1.3), location: 0.01),
                    .init(color: Color(red: 1.1, green: 1.0, blue: 0.16), location: 0.3),
                ], center: .center, startRadius: 100, endRadius: 1000)
                
                .ignoresSafeArea()
                VStack(spacing: -40){
                    HStack{
                        ZStack{
                            Text("Hello \n**\(loginvm.userName)**!")
                                .font(.system(size: 35))
                                .frame(width: 200, height: 170)
                                .padding()
                            Image(systemName: "person")
                                .padding(.bottom, 110)
                                .padding(.leading, -80)
                        }
                        //Image
                        Image("\(homevm.userimg)")
                            .frame(width: 150, height: 220)
                            .logoimaged()
                        Spacer()
                        
                        
                    }
                    //Rank Identification
                    HStack(spacing: 0){
                        capsuleText(text: "Rank: \(homevm.rank)")
                            .frame(height:10, alignment: .trailing)
                            .padding(.trailing, 50)
                            .padding(.bottom, 350)
                            .padding(.trailing,50)
                            .shadow(radius: 5)
                          
                        
                        //Medal stars can change
                        Image("\(homevm.usermedal)")
                            .resizable()
                            .frame(width: 90, height: 90)
                            .padding(.trailing, 100)
                            .padding(.leading, -70)
                        
                            .padding(.bottom, 350)
                    }
                }
                .padding(.bottom, 170)
                
                VStack(spacing:0){
                    ZStack{
                        Text("What Do you want to Learn Today?")
                            .font(.system(size: 20))
                            .highlighted()
                            .padding(.leading, 20)
                        VStack(spacing:-50){
                            HStack(spacing:-35){
                                ForEach (0..<2){ number
                                    in
                                    NavigationLink(destination:destinations[number]){
                                        VStack(spacing:-30){
                                            Image(imgnames[number])
                                                .resizable()
                                                .buttoned()
                                                .padding(.bottom, -20)
                                            Text("\(names[number])")
                                                .padding(.leading, 16)
                                                .foregroundColor(.black)
                                                .bold()
                                            
                                        }
                                        .padding(.bottom)
                                    }
                                }
                            }
                            HStack(spacing: -40){
                                ForEach (2..<4){ number
                                    in
                                    NavigationLink(destination:destinations[number]){
                                        VStack(spacing:-50){
                                            Image(imgnames[number])
                                                .resizable()
                                                .buttoned()
                                            Text("\(names[number])")
                                                .padding(.leading, 19)
                                                .foregroundColor(.black)
                                                .bold()
                                        }
                                        .padding(.bottom)
                                    }
                                }
                            }
                        }
                        .padding(.leading, -30 )
                    }
                    
                }
                .frame(width: 370, height: 465)
                .padding(.vertical, 20)
                .background( ZStack {
                    // Regular material background
                    Color.clear.background(.regularMaterial)
                    Color(customblue).opacity(0.5)
                })
                .clipShape(.rect(cornerRadius: 20))
                .padding(.top, 280)
                
            }
            .ignoresSafeArea()
            
        }
    }
}

#Preview {
    HomePageView()
}
