//
//  ChatView.swift
//  EducaFun
//
//  Created by Meerthika S R on 10/09/24.
//

import SwiftUI

struct ChatView: View {
    let memb = ["1", "2", "3", "4", "5", "6"]
    @StateObject var clanvw = ClanViewModel()
    var body: some View {
        NavigationStack{
            ZStack{
                RadialGradient(stops: [
                    .init(color: Color(red: 0.9, green: 0.8, blue: 0.7), location: 0.01),
                    .init(color: Color(red: 0.6, green: 0.3, blue: 0.1), location: 0.3),
                ], center: .center, startRadius: 100, endRadius: 1000)
                
                .ignoresSafeArea()
                
                VStack{
                    ZStack{
                        Image("sword")
                            .resizable()
                            .frame(width: 300, height: 300)
                            .padding(.bottom, 530)
                        Text("Clash of Clans")
                            .bold()
                            .font(.system(size: 35))
                            .padding(.bottom, 650)
                        Text("Team Members")
                            .bold()
                            .font(.system(size: 18))
                            .padding(.bottom, 590)
                    }
                }
                VStack{
                    Text("")
                        .padding(.top, 20)
                    ScrollView{
                        //Enter the Clan Name
                        ForEach(0..<memb.count){
                            number in
                            VStack{
                                HStack(){
                                    ZStack{
                                        HStack(){
                                            Text("\(number+1).")
                                                .bold()
                                                .padding()
                                            Text("\(memb[number])" )
                                                .bold()
                                            Spacer()
                                        }
                                        scoreText(text: "2000XP")
                                            .padding(.leading, 200)
                                    }
                                    .clanmembpadded()
                                }
                                
                            }
                        }
                    }
                }
                .frame(maxWidth :350, maxHeight: 470)
                .background(.gray.opacity(0.3))
                .clipShape(.rect(cornerRadius: 90))
                .padding(.horizontal)
                .padding(.top, 80)
                
                VStack{
                    NavigationLink(destination:  GlobalChatView()){
                        
                        Text("Let's Chat")
                            .chatbuttoned()
                    }
                }
                .padding(.top, 650)
            }
        }
    }
    }

#Preview {
    ChatView()
}

struct scoreText: View{
    var text:String
    var body: some View{
        Text(text)
            .frame(width: 60, height: 10)
            .font(.system(size: 14))
            .bold()
            .padding()
            .foregroundStyle(.black)
            .background(Color(.brown).opacity(0.6))
            .clipShape(.rect(cornerRadius: 20))
        
        }
}

struct clanmembpad: ViewModifier{
   func body (content: Content) -> some View{
       content
           .multilineTextAlignment(.trailing)
           .font(.system(size: 15))
           .frame(width:320, height:60)
           .background(Color.white)
           .clipShape(.rect(cornerRadius: 65))
           .shadow(radius: 0.5)
           
       }
}


extension View{
  func clanmembpadded() -> some View{
      self.modifier(clanmembpad())
  }
}

struct chatbutton: ViewModifier{
   func body (content: Content) -> some View{
       content
           .bold()
           .foregroundStyle(.black)
           .frame(width: 260, height: 70)
           .clipShape(Capsule())
               .overlay(
                   Capsule()
                       .stroke(Color.black.opacity(0.7), lineWidth: 10)
               )
               .background(Color(custombrown).opacity(0.3))
           .cornerRadius(50)
           
       }
}

extension View{
  func chatbuttoned() -> some View{
      self.modifier(chatbutton())
  }
}
