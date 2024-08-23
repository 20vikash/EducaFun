//
//  RegisterView.swift
//  EducaFun
//
//  Created by Vikash on 22/08/24.
//

import SwiftUI


import SwiftUI

struct RegisterView: View {
  @State var name = ""
  @State var email = ""
  @State var password = ""
  var body: some View {
      ZStack(){
          Rectangle()
              .fill(.white)
          VStack{
  //The Name, email and password for the newly registered User
              TextField("Name", text:$name)
                  .registerpadded()
              TextField("Email Address", text: $email)

                  .registerpadded()
                  
              TextField("Password", text:$password)
                  .registerpadded()
              

                  .padding(.bottom, 300)
          }
          ZStack{
             Circle()
                  .fill(Color(customyellow))
              .frame(width: 800, height: 700)
              .offset(x: 50, y: 400)
              
              Button{
                  //Register Button
              } label: {
                  ZStack{
                      Rectangle()
                          .foregroundColor(Color(customblue))
                          .frame(width:300, height:55)
                          .clipShape(.rect(cornerRadius: 65))
                          .shadow(radius: 6)
                      Text("Sign Up")
                          .foregroundColor(.white)
                          .bold()
                  }
              }
          }
          VStack{
              Text("Registration")
                  .foregroundStyle(.black)
                  .bold()
                  .font(.title)
                  .padding(.bottom, 590)
          }
      }
      .ignoresSafeArea()
  }
}

#Preview {
  RegisterView()
}

struct registerpad: ViewModifier{
  func body (content: Content) -> some View{
      content
          .multilineTextAlignment(.center)
          .foregroundColor(.black)
          .font(.system(size: 15))
          .frame(width:290, height:50)
          .background(Color(.white))
          .clipShape(.rect(cornerRadius: 65))
          .border(Color.black, width:1)
          .shadow(radius: 0.5)
          
      }
}

extension View{
  func registerpadded() -> some View{
      modifier(registerpad())
  }
}
