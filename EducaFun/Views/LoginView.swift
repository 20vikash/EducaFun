//
//  Header.swift
//  EducaFun
//
//  Created by Vikash on 22/08/24.
//

import SwiftUI
import AlertToast

struct LoginView: View {
    @State var showSheet = false
    @StateObject var loginVm = LoginViewViewModel()
    
    var body: some View {
        if (loginVm.canNavigate) {
            HomePageView()
        }
        else {
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
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                        .formpadded()
                    SecureField("Password", text: $loginVm.password)
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                        .formpadded()
                        .padding(7)
                    VStack(){
                        Button{
                            loginVm.login()
                        } label:{
                            ZStack{
                                Rectangle()
                                    .foregroundColor(Color(customblue))
                                    .frame(width:300, height:55)
                                    .clipShape(.rect(cornerRadius: 65))
                                    .shadow(radius: 6)
                                if loginVm.isLoading {
                                    ProgressView()
                                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                                } else {
                                    Text("Log in")
                                        .foregroundColor(.white)
                                        .bold()
                                }
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
                        showSheet.toggle()
                    } label: {
                        Text("Sign Up!")
                            .padding(10)
                            .bold()
                            .foregroundColor(customblue)
                            .padding(.top, 0)
                            .padding(.bottom, 40)
                    }
                    .sheet(isPresented: $showSheet, content: {
                        RegisterView(showSheet: $showSheet)
                    })
                }
            }
            .ignoresSafeArea()
            .toast(isPresenting: $loginVm.errorToast) {
                AlertToast(type: .error(.red), title: loginVm.errorMessage)
            }
        }
    }
}
 
#Preview {
    LoginView()
}
