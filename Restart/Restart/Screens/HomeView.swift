//
//  HomeView.swift
//  Restart
//
//  Created by Cesar Vargas Tapia on 29/05/23.
//

import SwiftUI

struct HomeView: View {
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = false
    @State private var isAnimating: Bool = false
    let hapticFeedback = UINotificationFeedbackGenerator()

    var body: some View {
        VStack(spacing: 20) {
            // MARK: -  Header
            Spacer()
            let image = #imageLiteral(resourceName: "character-2")
            ZStack {
                CircleGroupView(ShapeColor: .gray,
                                ShapeOpacity: 0.1)
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                .padding()
                .offset(y: isAnimating ? 35 : -35)
                .animation(
                    Animation
                    .easeInOut(duration: 4)
                    .repeatForever()
                , value: isAnimating)
            }

            // MARK: -  Center
            Text("The time that leads to mastery is dependen on the intensity of our focus.")
                .font(.title3)
                .fontWeight(.light)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding()
            
            // MARK: -  Footer
            Spacer()
            
            Button(action: {
                withAnimation {
                    playSound(sound: "success", extension: "m4a")
                    hapticFeedback.notificationOccurred(.success)
                    isOnboardingViewActive = true
                }
            }) {
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                    .imageScale(.large)
                
                    
                Text("Restart")
                    .font(.system(.title3, design: .rounded))
                    .fontWeight(.bold)
            }// Button
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6, execute: {
                isAnimating = true
            })
        }.preferredColorScheme(.light)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
