//
//  Header.swift
//  EducaFun
//
//  Created by Vikash on 22/08/24.
//

import SwiftUI

let customyellow = Color(red: 1.0, green: 1.0, blue: 0.0)
let customblue = Color(red: 0.06, green: 0.7, blue: 0.8)

struct LoginView: View {
   @State private var showsheet = false
   @State var email = ""
   @State var password = ""
   var body: some View {
       ZStack{
           RadialGradient(stops: [
               .init(color: customyellow, location: 0.36),
               .init(color: customblue, location: 0.2),
           ], center: .center, startRadius: 100, endRadius: 1000)
           VStack(){
               Image("educafun logo")
                   .resizable()
                   .frame(width: 450, height: 450)
           }
           .padding(.bottom, 300)
           VStack(){
               Text("Welcome Back!")
                   .font(.title2)
                   .bold()
   //Email Address form and password form
               TextField("Email Address", text: $email)
                   .formpadded()
               SecureField("Password", text:$password)
                   .formpadded()
                   .padding(7)
               VStack(){
                   Button{
   //Atteempt to login
                   } label:{
                       ZStack{
                           Rectangle()
                               .foregroundColor(Color(customblue))
                               .frame(width:300, height:55)
                               .clipShape(.rect(cornerRadius: 65))
                               .shadow(radius: 6)
                           Text("Log In")
                               .foregroundColor(.white)
                               .bold()
                       }
                   }
               }
               .padding(.top, 20)
 
           }
           
           .padding(.top, 200)
           VStack(spacing:0){
               Spacer()
               Text("New Around here?")
                   .font(.system(size: 13))
                   .bold()
               
               //Sign Up Button and Register Navigation
               Button{
                   showsheet.toggle()
               } label: {
                   Text("Sign Up!")
                       .padding(10)
                       .bold()
                       .foregroundColor(customblue)
                       .padding(.top, 0)
                       .padding(.bottom, 40)
               }
               .sheet(isPresented: $showsheet, content: {
                       RegisterView()
               })
           }
       }
       .ignoresSafeArea()
   }
}
 
#Preview {
   LoginView()
}
 
struct loginform: ViewModifier{
   func body (content: Content) -> some View{
       content
           .textFieldStyle(RoundedBorderTextFieldStyle())
           .frame(maxWidth: 300, alignment: .center)
           .clipShape(.rect(cornerRadius: 90))
 
       }
}
 
extension View{
   func loginformed() -> some View{
       modifier(loginform())
   }
}
 
struct formpad: ViewModifier{
   func body (content: Content) -> some View{
       content
           .multilineTextAlignment(.center)
           .font(.system(size: 15))
           .frame(width:290, height:50)
           .background(Color.white)
           .clipShape(.rect(cornerRadius: 65))
           .shadow(radius: 0.5)
           
       }
}
 
extension View{
   func formpadded() -> some View{
       modifier(formpad())
   }
}
