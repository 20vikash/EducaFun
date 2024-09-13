//
//  FunLabView.swift
//  EducaFun
//
//  Created by Meerthika S R on 07/09/24.
//

//
//  TrainTroopsView.swift
//  EducaFun
//
//  Created by Meerthika S R on 10/09/24.
//

import SwiftUI

struct FunLabView: View {
    let labtype = ["BioLab", "RoboticsLab", "EnvironmentLab", "AbstractLab"]
    let labviews: [AnyView] = [
        AnyView(BioView()), // Replace with the appropriate views
 
        AnyView(RoboticsLabView()),
        AnyView(EnvironmentLabView()),
        AnyView(AbstractLabView())
    ]
    let labname = ["Bio Lab", "Robotics Lab", "EnvironmentLab", "Abstract Lab"]
    @StateObject var quizvm = QuizViewModel()
    var body: some View {
        NavigationStack{
            ZStack{
                RadialGradient(stops: [
                    .init(color: Color(red: 1.2, green: 0.9, blue: 1.3), location: 0.01),
                    .init(color: Color(red: 1.1, green: 1.0, blue: 0.16), location: 0.3),
                ], center: .center, startRadius: 100, endRadius: 1000)
                
                .ignoresSafeArea()

                ZStack{
                    VStack{
                        ZStack{
                            Text("Select Your Lab")
                                .foregroundStyle(.white)
                                .bold()
                                .font(.system(size: 30))
                                .padding(.top, 20)
                                .padding(.bottom, 15)
                                .troophighlighted()
                            Spacer()
                        }
                        .padding(.bottom, 450)
                    }
                    VStack(spacing: 50){
                        HStack(spacing: 10){
                            ForEach (0..<2){
                                number in
                                NavigationLink(destination: labviews[number]){
                                    VStack(spacing: -10){
                                        Image(labtype[number])
                                            .resizable()
                                            .frame(width: 200, height: 200)
                                            .clipShape(Circle())
                                            .overlay(
                                                Rectangle()
                                                    .stroke(Color(customyellow).opacity(0.6), lineWidth: 7)
                                                    .frame(width: 150)
                                            )
                                        Text("\(labname[number])")
                                            .bold()
                                            .font(.system(size: 20))
                                            .foregroundStyle(.black)
                                            .justhighlighted()
                                    }
                                    .padding(.top, 150)
                                    .shadow(radius: 6)
                                }
                            }
                        }
                        HStack(spacing: 10){
                            ForEach (2..<4){
                                number in
                                NavigationLink(destination: labviews[number]){
                                    VStack(spacing: -10){
                                        Image(labtype[number])
                                            .resizable()
                                            .frame(width: 200, height: 200)
                                            .clipShape(Circle())
                                            .overlay(
                                                Rectangle()
                                                    .stroke(Color(customyellow).opacity(0.6), lineWidth: 7)
                                                    .frame(width: 150)
                                            )
                                        Text("\(labname[number])")
                                            .bold()
                                            .font(.system(size: 20))
                                            .foregroundStyle(.black)
                                            .justhighlighted()
                                    }
                                    .padding(.bottom, 50)
                                    .shadow(radius: 6)
                                }
                            }
                        }
                        
                        
                    }
                    .padding(.top, 100)
                    
                }
                .padding(.bottom, 160)
                
            }
        }
    }
}

#Preview {
    FunLabView()
}

struct funlabhighlight: ViewModifier{
    func body (content: Content) -> some View{
        content
            .padding(.leading, 20)
            .padding(.trailing, 20)
            .background(.black.opacity(0.9))
            .clipShape(.capsule)
        
    }
}
extension View{
  func funlabhighlighted() -> some View{
      self.modifier(funlabhighlight())
  }
}



