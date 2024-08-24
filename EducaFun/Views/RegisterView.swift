//
//  RegisterView.swift
//  EducaFun
//
//  Created by Vikash on 22/08/24.
//

import SwiftUI


import SwiftUI

struct RegisterView: View {
    @StateObject var registerVm = RegisterViewViewModel()
    
    var body: some View {
        ZStack(){
            Rectangle()
                .fill(.white)
            VStack{
                //The FullName, UserName and password for the newly registered User
                TextField("Full Name", text: $registerVm.fullName)
                    .registerpadded()
                TextField("User Name", text: $registerVm.userName)
                
                    .registerpadded()
                
                TextField("Password", text: $registerVm.password)
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
