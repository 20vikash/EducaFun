//
//  ClanView.swift
//  EducaFun
//
//  Created by Meerthika S R on 07/09/24.
//

import SwiftUI

struct ClanView: View {
    let Clannames = ["0", "A", "Bdsf", "Cdsg", "D", "Eian", "A", "B", "C", "D", "Ebra"]
    var body: some View {
        NavigationStack{
            ZStack{
                RadialGradient(stops: [
                    .init(color: Color(red: 0.8, green: 0.11, blue: 0.15), location: 0.01),
                    .init(color: Color(red: 0.6, green: 0.11, blue: 0.15), location: 0.3),
                ], center: .center, startRadius: 100, endRadius: 1000)
                
                .ignoresSafeArea()
                
                ZStack{
                    Image("clanbanner")
                        .padding(.bottom, 350)
                        .padding(.leading, 22)
                        .ignoresSafeArea()
                    
                    
                }
                VStack{
                    VStack{
                        Text("LeaderBoard")
                            .clanhighlighted()
                            .bold()
                            .padding(.top, 20)
                            .font(.system(size: 35))
                        
                        ScrollView{
                            //Enter the Clan Name
                            ForEach(0..<Clannames.count){
                                number in
                                VStack{
                                    HStack(){
                                        ZStack{
                                            HStack(){
                                                Text("\(number+1).")
                                                    .bold()
                                                    .padding()
                                                Text("\(Clannames[number])" )
                                                    .bold()
                                                Spacer()
                                            }
                                            
                                            NavigationLink(destination: ChatView()) {
                                                joinText(text: "Join")
                                                    .padding(.leading, 200)
                                            }
                                            
                                        }
                                        .clanpadded()
                                    }
                                    
                                }
                            }
                        }
                    }
                    .frame(maxWidth :350, maxHeight: 470)
                    .background(.white.opacity(0.3))
                    .clipShape(.rect(cornerRadius: 90))
                    .padding(.horizontal)
                    .padding(.bottom, 20)
                }
                NavigationLink(destination: TrainTroopsView()) { // Proper use of NavigationLink
                    Image("Shield")
                        .resizable()
                        .frame(width: 150, height: 150)
                        .padding(.top, 620)
                }
            }
        }
    }
}

#Preview {
    ClanView()
}






