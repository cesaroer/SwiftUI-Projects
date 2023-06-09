//
//  ContentView.swift
//  Restart
//
//  Created by Cesar Vargas Tapia on 29/05/23.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    
    var body: some View {
        ZStack {
            if isOnboardingViewActive {
                OnBoardingView()
            } else {
                HomeView()
            }
        }.animation(.easeOut(duration: 0.8), value: isOnboardingViewActive)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
