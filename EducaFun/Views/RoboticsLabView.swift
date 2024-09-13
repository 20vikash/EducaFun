//
//  RoboticsLabView.swift
//  EducaFun
//
//  Created by Meerthika S R on 13/09/24.
//

import SwiftUI

struct RoboticsLabView: View {
    @State var Info: String = ""
    var body: some View {
        VStack{
            onrobot()
                .frame(width:400, height: 600)
                .ignoresSafeArea()
            VStack{
                Text("View the Full Model")
                    .bold()
                    .padding(.top)
                Text("4 Armed Robot")
                TextEditor(text: $Info)
                    .padding(30)
                    .robotquestionformpadded()
            }
            .padding(.top, 20)
        }
        .padding(.bottom, 200)
            
        }
    }

#Preview {
    RoboticsLabView()
}

import SplineRuntime
import SwiftUI

struct onrobot: View {
    var body: some View {
        // fetching from cloud
        let url = URL(string: "https://build.spline.design/9AhqLSwnovRQt3Eo68xJ/scene.splineswift")!

        // fetching from local
        // let url = Bundle.main.url(forResource: "scene", withExtension: "splineswift")!

        SplineView(sceneFileURL: url)
    }
}

struct robotquestionformpad: ViewModifier{
   func body (content: Content) -> some View{
       content
           .multilineTextAlignment(.leading)
           .font(.system(size: 15))
           .frame(width:370, height:150)
           .background(Color.white)
           .clipShape(Capsule())
               .overlay(
                   Capsule()
                    .stroke(.black.opacity(0.6), lineWidth: 2)
               )
           
       }
}

extension View{
  func robotquestionformpadded() -> some View{
      modifier(robotquestionformpad())
  }
}
