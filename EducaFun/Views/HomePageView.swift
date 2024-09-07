//
//  HomePageView.swift
//  EducaFun
//
//  Created by Vikash on 24/08/24.
//

import SwiftUI

struct HomePageView: View{
    //Here Hashable was there
    @State var nextpage = ""
    @State var names = ["FunLab", "Quizzes", "Clan War", "EducaFun AI"]
    let options = ["Funlab", "Quiz", "Clans", "EducafunAI"]
    let destinations: [AnyView] = [
        AnyView(FunLabView()), // Replace with the appropriate views
        AnyView(QuizView()),
        AnyView(ClanView()),
        AnyView(EducaAIView())
    ]
    @State private var name = "Meerthika"
    @State private var profilepic = ""
    @State private var rank = 10000
    @State var medals = ["Beginner", "Intermediate", "Advanced", "Legend", "Master"]
    var body: some View {
        NavigationStack{
            ZStack(){
                Rectangle()
                    .fill(customyellow.opacity(0.83))
                    .ignoresSafeArea()
                VStack(spacing: -40){
                    HStack{
                        ZStack{
                            Text("Hello \n**\(name)**!")
                                .font(.system(size: 35))
                                .frame(width: 200, height: 170)
                                .padding()
                            Image(systemName: "person")
                                .padding(.bottom, 110)
                                .padding(.leading, -80)
                        }
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
                        
                        //Medal stars can change
                        Image("Beginner")
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
                            .highlighted()
                            .padding(.leading, 20)
                        VStack(spacing:-50){
                            HStack(spacing:-35){
                                ForEach (0..<2){ number
                                    in
                                    NavigationLink(destination:destinations[number]){
                                        VStack(spacing:-30){
                                            Image(options[number])
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
                                            Image(options[number])
                                                .resizable()
                                                .buttoned()
                                            Text("\(names[number])")
                                                .padding(.leading, 16)
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
}

#Preview {
    HomePageView()
}
struct HomeView: View {
    var body: some View {
        Text("This is the Home view")
    }
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

struct buttons: ViewModifier{
    func body (content: Content) -> some View{
        content
            .frame(width: 220, height:220)
            .padding()
            .padding(.trailing, -30)
            .shadow(radius: 5)
    }
}
extension View{
  func buttoned() -> some View{
      modifier(buttons())
  }
}

struct highlight: ViewModifier{
    func body (content: Content) -> some View{
        content
            .padding(.leading, 10)
            .padding(.trailing, 10)
            .background(Color(customyellow).opacity(0.9))
            .clipShape(.capsule)
            .font(.system(size: 19))
            .padding(.bottom, 390)
            .padding(.trailing, 30)
            .font(.system(size: 20))
        
    }
}

extension View{
  func highlighted() -> some View{
      modifier(highlight())
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

