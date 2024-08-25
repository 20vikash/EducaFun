//
//  RegisterView.swift
//  EducaFun
//
//  Created by Vikash on 22/08/24.
//

import SwiftUI
import AlertToast

struct RegisterView: View {
    @Binding var showSheet: Bool
    
    @StateObject var registerVm = RegisterViewViewModel()
    
    var body: some View {
        ZStack(){
            Rectangle()
                .fill(.white)
            VStack{
                //The FullName, UserName and password for the newly registered User
                TextField("Full Name", text: $registerVm.fullName)
                    .autocorrectionDisabled()
                    .autocapitalization(.none)
                    .registerpadded()
                TextField("User Name", text: $registerVm.userName)
                    .autocorrectionDisabled()
                    .autocapitalization(.none)
                    .registerpadded()
                
                SecureField("Password", text: $registerVm.password)
                    .registerpadded()
                    .padding(.bottom, 300)
            }
            ZStack{
                Circle()
                    .fill(Color(customyellow))
                    .frame(width: 800, height: 700)
                    .offset(x: 50, y: 400)
                
                Button{
                    registerVm.registerUser()
                } label: {
                    ZStack{
                        Rectangle()
                            .foregroundColor(Color(customblue))
                            .frame(width:300, height:55)
                            .clipShape(.rect(cornerRadius: 65))
                            .shadow(radius: 6)
                        if registerVm.isLoading {
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle(tint: .white))
                        } else {
                            Text("Sign Up")
                                .foregroundColor(.white)
                                .bold()
                        }
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
        .toast(isPresenting: $registerVm.showToast) {
            AlertToast(type: .error(.red), title: registerVm.errorMessage)
        }
        .toast(isPresenting: $registerVm.successfulRegister) {
            AlertToast(type: .complete(customyellow), title: "Registered user successfully")
        }
        .onReceive(registerVm.$successfulRegister) { successful in
            if successful {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    showSheet = false
                }
            }
        }
    }
}

#Preview {
    RegisterView(showSheet: .constant(true))
}
