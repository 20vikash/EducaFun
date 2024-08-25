//
//  ContentView.swift
//  EducaFun
//
//  Created by Vikash on 22/08/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        let vm = ContentViewViewModel()
        
        if (vm.isAuthenticated()) {
            
            HomePageView()

        } else {
            LoginView()
        }
//        TestView()
    }
}

#Preview {
    ContentView()
}
