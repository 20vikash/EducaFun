//
//  MathTrainView.swift
//  EducaFun
//
//  Created by Meerthika S R on 11/09/24.
//

import SwiftUI

struct MathTrainView: View {
    @State private var correctanswer : String = ""
    @StateObject var mathtr = MathTrainViewModel()
    var body: some View {
        ZStack{
            Rectangle()
                .fill(.gray.opacity(0.5))
                .overlay(
                    Rectangle()
                        .stroke(.black.opacity(1.0), lineWidth: 20)
                )
                .ignoresSafeArea()
                .frame(height: 250)
                .cornerRadius(30)
                .padding(.bottom, 700)
 
                
            VStack{
                HStack(spacing: -50){
                    Image("MathTrain")
                        .resizable()
                        .frame(width: 230, height: 230)
                        .padding(.bottom, 590)
                    Text("Math Troops")
                        .bold()
                        .font(.system(size: 35))
                        .frame(width: 230)
                        .foregroundStyle(.black)
                        .padding(.bottom, 590)
                        .padding(.trailing, 70)
                }
            }
            .padding(.bottom, 30)
            VStack(spacing: 20){
                VStack{
                    Text("Question:")
                        .bold()
                        .font(.system(size: 20))
                        .padding(.trailing, 256)
                    
                    TextEditor(text: $mathtr.mathquestion)
                        .padding(20)
                        .questionformpadded()
                }
                VStack{
                    Text("Answers:")
                        .font(.system(size: 20))
                        .bold()
                        .padding(.trailing, 256)
                    ForEach (0..<4){ number in
                        TextField("Option \(number+1)", text: $mathtr.mathoptions[number])
                            .answerformpadded()
                        
                    }
                }
            }
            .padding(.top, 50)
            .padding(.bottom, 40)
            VStack{
                HStack{
                    //The given correct option is in STRING)))))))))
                    Text("Correct Option:")
                        .bold()
                    TextField("", text: $correctanswer)
                        .optionansweformpadded()
                }
                Button{
                    //Next Question
                } label: {
                    Text("Next Question")
                        .mathnextquestioned()
                }
            }
            .padding(.top, 600)
        }
    }
}

#Preview {
    MathTrainView()
}




