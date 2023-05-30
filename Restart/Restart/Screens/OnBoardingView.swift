//
//  OnBoardingView.swift
//  Restart
//
//  Created by Cesar Vargas Tapia on 29/05/23.
//

import SwiftUI

struct OnBoardingView: View {
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true

    var body: some View {
        VStack(spacing: 20) {
            Text("On Boarding").font(.largeTitle)
            
            Button(action:{
                isOnboardingViewActive = false
            }) {
                Text("Start")
            }
        }// VStack
    }
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}
