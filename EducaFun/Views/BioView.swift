//
//  RoboticsLabView.swift
//  EducaFun
//
//  Created by Meerthika S R on 13/09/24.
//

import SwiftUI

struct BioView: View {
    @State var Info: String = ""
    var body: some View {
        VStack{
            onbio()
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

struct onbio: View {
    var body: some View {
        // fetching from cloud
        let url = URL(string: "https://build.spline.design/9AhqLSwnovRQt3Eo68xJ/scene.splineswift")!

        // fetching from local
        // let url = Bundle.main.url(forResource: "scene", withExtension: "splineswift")!

        SplineView(sceneFileURL: url)
    }
}
