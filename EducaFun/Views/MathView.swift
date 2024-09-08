//
//  MathView.swift
//  EducaFun
//
//  Created by Meerthika S R on 08/09/24.
//

import SwiftUI

struct MathView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            Text("Math View Content")
                .font(.largeTitle)
                .padding()

            Spacer()
        }
        .navigationTitle("Maths")
        .navigationBarItems(leading: Button(action: {
            presentationMode.wrappedValue.dismiss()  // Dismiss the full-screen cover
        }) {
            Text("Back")
                .font(.headline)
        })
    }
}

#Preview {
    MathView()
}
