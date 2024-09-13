//
//  EnvironmentLabView.swift
//  EducaFun
//
//  Created by Meerthika S R on 13/09/24.
//

import SwiftUI
import SplineRuntime
struct EnvironmentLabView: View {
    var body: some View {
        onenv()
            .frame(width:400, height: 500)
            .padding(.top, 70)
            .ignoresSafeArea()
        VStack{
            Text("Japanese Shrine")
                .font(.system(size: 30))
                .bold()
                .padding(.top)
            Text("Shinto shrines (神社, jinja) are places of worship and the dwellings of the kami, the Shinto gods. Sacred objects of worship that represent the kami are stored in the innermost chamber of the shrine where they cannot usually be seen by anybody. In some cases, a mountain, waterfall or rock behind the shrine building can be the object of worship.")
                .padding(25)
                .factformpadded()
        }
        .padding(.bottom, 200)
    }
    }

#Preview {
    EnvironmentLabView()
}

struct onenv: View {
    var body: some View {
        let url = URL(string: "https://build.spline.design/oY61Ye1zAKWa4G76fbVS/scene.splineswift")!

        // fetching from local
        // let url = Bundle.main.url(forResource: "scene", withExtension: "splineswift")!

        SplineView(sceneFileURL: url)
    }
}

struct factformpad: ViewModifier{
   func body (content: Content) -> some View{
       content
           .multilineTextAlignment(.leading)
           .font(.system(size: 15))
           .frame(width:370, height:200)
           .background(Color.white)
           .clipShape(Rectangle())
               .overlay(
                   Rectangle()
                    .stroke(.red.opacity(0.6), lineWidth: 2)
               )
           
       }
}

extension View{
  func factformpadded() -> some View{
      modifier(factformpad())
  }
}
