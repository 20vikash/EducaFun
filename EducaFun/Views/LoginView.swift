//
//  Header.swift
//  EducaFun
//
//  Created by Vikash on 22/08/24.
//

import SwiftUI


struct LoginView: View {
    
    @StateObject var loginVm = LoginViewViewModel()
    
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
                TextField("User name", text: $loginVm.userName)
                    .formpadded()
                SecureField("Password", text: $loginVm.password)
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
                    loginVm.showSheet.toggle()
                } label: {
                    Text("Sign Up!")
                        .padding(10)
                        .bold()
                        .foregroundColor(customblue)
                        .padding(.top, 0)
                        .padding(.bottom, 40)
                }
                .sheet(isPresented: $loginVm.showSheet, content: {
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
