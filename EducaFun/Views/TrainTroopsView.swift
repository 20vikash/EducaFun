//
//  TrainTroopsView.swift
//  EducaFun
//
//  Created by Meerthika S R on 10/09/24.
//

import SwiftUI

struct TrainTroopsView: View {
    @StateObject var quizvm = QuizViewModel()
    var body: some View {
        ZStack{
            VStack{
                Text("Select the Subject")
                    .bold()
                    .font(.system(size: 25))
                    .clanhighlighted()
                Spacer()
            }
            VStack(spacing: 50){
                HStack(spacing: 50){
                    ForEach (0..<2){
                        number in
                        VStack(spacing: -10){
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
                        .padding(.bottom, 30)
                        .frame(maxWidth :150, maxHeight: 150)
                        .background( ZStack {
                            // Regular material background
                            Color.clear.background(.regularMaterial)
                            Color(customblue).opacity(0.1)
                        })
                        .clipShape(.rect(cornerRadius: 20))
                        .shadow(radius: 6)
                    }
                }
                HStack(spacing: 50){
                    ForEach (2..<4){
                        number in
                        VStack(spacing: -10){
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
                        .padding(.bottom, 30)
                        .frame(maxWidth :150, maxHeight: 150)
                        .background( ZStack {
                            // Regular material background
                            Color.clear.background(.regularMaterial)
                            Color(customblue).opacity(0.1)
                        })
                        .clipShape(.rect(cornerRadius: 20))
                        .shadow(radius: 6)
                    }
                }
                
                
            }
            .padding(.bottom, 250)
            
            VStack{
                
            Circle()
                .fill(Color(customyellow))
                .frame(width: 800, height: 700)
                .offset(x: 50, y: 470)
            }
        }
    }
}

#Preview {
    TrainTroopsView()
}


