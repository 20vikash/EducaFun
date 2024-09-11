//
//  VocabTrainView.swift
//  EducaFun
//
//  Created by Meerthika S R on 11/09/24.
//

import SwiftUI

//
//  MathTrainView.swift
//  EducaFun
//
//  Created by Meerthika S R on 11/09/24.
//

import SwiftUI

struct VocabTrainView: View {
    @State private var correctanswer : String = ""
    @StateObject var vocabtr = VocabTrainViewModel()
    var body: some View {
        ZStack{
            Rectangle()
                .fill(.green.opacity(0.3))
                .overlay(
                    Rectangle()
                        .stroke(.green.opacity(1.0), lineWidth: 20)
                )
                .ignoresSafeArea()
                .frame(height: 250)
                .cornerRadius(30)
                .padding(.bottom, 700)
 
                
            VStack{
                HStack(spacing: -50){
                    Image("VocabTrain")
                        .resizable()
                        .frame(width: 230, height: 230)
                        .padding(.bottom, 590)
                    Text("Vocab Troops")
                        .bold()
                        .font(.system(size: 35))
                        .frame(width: 230)
                        .foregroundStyle(.black.opacity(1.7))
                        .padding(.bottom, 590)
                        .padding(.trailing, 70)
                }
            }
            .padding(.bottom, 30)
            VStack(spacing: 20){
                VStack{
                    Text("Question:")
                        .bold()
                        .foregroundStyle(.black.opacity(1.7))
                        .font(.system(size: 20))
                        .padding(.trailing, 256)
                    
                    TextEditor(text: $vocabtr.vocabquestion)
                        .padding(20)
                        .questionformpadded()
                        .clipShape(Capsule())
                            .overlay(
                                Capsule()
                                 .stroke(.green.opacity(0.6), lineWidth: 3)
                            )
                }
                VStack{
                    Text("Answers:")
                        .font(.system(size: 20))
                        .bold()
                        .foregroundStyle(.black.opacity(1.7))
                        .padding(.trailing, 256)
                    ForEach (0..<4){ number in
                        TextField("Option \(number+1)", text: $vocabtr.vocaboptions[number])
                            .answerformpadded()
                            .clipShape(Capsule())
                                .overlay(
                                    Capsule()
                                     .stroke(.green.opacity(0.7), lineWidth: 3)
                                )
                        
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
                        .overlay(
                            Capsule()
                             .stroke(.green.opacity(0.6), lineWidth: 3)
                             
                        )
                }
                Button{
                    //Next Question
                } label: {
                    Text("Next Question")
                        .vocabnextquestioned()
                }
            }
            .padding(.top, 600)
        }
    }
}

#Preview {
    VocabTrainView()
}






