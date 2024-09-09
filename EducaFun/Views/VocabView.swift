//
//  VocabView.swift
//  EducaFun
//
//  Created by Meerthika S R on 09/09/24.
//

import SwiftUI

struct VocabView: View {
    @Binding var isPresented: Bool  // Binding to control presentation

    var body: some View {
        VStack {
            Text("Vocan View Content")
                .font(.largeTitle)
                .padding()
        }
        .navigationBarItems(leading: Button(action: {
            isPresented = false  // Dismiss the full-screen cover
        }) {
            Text("Back")
                .font(.headline)
        })
    }
}

#Preview{
    VocabView(isPresented: .constant(false))
}
