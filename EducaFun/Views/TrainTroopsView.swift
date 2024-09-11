//
//  TrainTroopsView.swift
//  EducaFun
//
//  Created by Meerthika S R on 10/09/24.
//

import SwiftUI

struct TrainTroopsView: View {
    let trooptype = ["MathTrain", "VocabTrain", "EcoTrain", "ScienceTrain"]
    let trainquestions: [AnyView] = [
        AnyView(MathTrainView()), // Replace with the appropriate views
 
        AnyView(VocabTrainView())
    ]
    @StateObject var quizvm = QuizViewModel()
    var body: some View {
        NavigationStack{
            ZStack{
                RadialGradient(stops: [
                    .init(color: Color(red: 0.8, green: 0.11, blue: 0.15), location: 0.01),
                    .init(color: Color(red: 0.6, green: 0.11, blue: 0.15), location: 0.3),
                ], center: .center, startRadius: 100, endRadius: 1000)
                
                .ignoresSafeArea()
                Rectangle()
                    .fill(.yellow.opacity(0.8))
                    .frame(width: 150)
                    .ignoresSafeArea()
                ZStack{
                    VStack{
                        ZStack{
                            Text("Select Your Troop Type")
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
                                NavigationLink(destination: trainquestions[number]){
                                    VStack(spacing: -10){
                                        Image(trooptype[number])
                                            .resizable()
                                            .frame(width: 200, height: 200)
                                            .clipShape(Circle())
                                            .overlay(
                                                Circle()
                                                    .stroke(Color(.black).opacity(0.6), lineWidth: 7)
                                                    .frame(width: 150)
                                            )
                                        Text("\(quizvm.subjects[number])")
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
                                VStack(spacing: -10){
                                    Image(trooptype[number])
                                        .resizable()
                                        .frame(width: 200, height: 200)
                                        .clipShape(Circle())
                                        .overlay(
                                            Circle()
                                                .stroke(Color(.black).opacity(0.6), lineWidth: 7)
                                                .frame(width: 150)
                                        )
                                    Text("\(quizvm.subjects[number])")
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
                    .padding(.top, 100)
                    
                }
                .padding(.bottom, 160)
                
            }
        }
    }
}

#Preview {
    TrainTroopsView()
}



