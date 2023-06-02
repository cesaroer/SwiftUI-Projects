//
//  OnBoardingView.swift
//  Restart
//
//  Created by Cesar Vargas Tapia on 29/05/23.
//

import SwiftUI

struct OnBoardingView: View {
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    @State private var buttonWidth: Double = UIScreen.main.bounds.width - 80
    @State private var buttonOffset: CGFloat = 0
    @State private var isAnimating: Bool = false
    
    var body: some View {
        ZStack {
            Color("ColorBlue")
                .ignoresSafeArea(.all, edges: .all)
            VStack(spacing: 20) {
                // MARK: -  HEADER
                Spacer()
                VStack(spacing: 0) {
                    Text("Share")
                        .font(.system(size: 60))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                    
                    Text("""
                            It's not how mucho we give but how much love we put into giving.
                            """)
                        .font(.title3)
                        .fontWeight(.light)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 10)
                }//: Header
                .opacity(isAnimating ? 1 : 0)
                .offset(y: isAnimating ? 0 : -40)
                .animation(.easeOut(duration: 1), value: isAnimating)
                
                // MARK: -  CENTER
                ZStack {
                    CircleGroupView(ShapeColor: .white,
                                    ShapeOpacity: 0.2)

                   let image =  #imageLiteral(resourceName: "character-1")
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .opacity(isAnimating ? 1 : 0)
                        .animation(.easeOut(duration: 0.5), value: isAnimating)
                }//: Center
                
                // MARK: -  FOOTER
                ZStack {
                    // Parts of custom button
                    
                    // 1.- Background
                    Capsule().fill(Color.white.opacity(0.2))
                    Capsule().fill(Color.white.opacity(0.2))
                        .padding(8)
                    // 2.- call action static
                    Text("Get Started")
                        .font(.system(.title3, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .offset(x:20)
                    
                    // 3.- capsule
                    HStack {
                        Capsule().fill(Color("ColorRed"))
                            .frame(width: buttonOffset + 80)
                        
                        Spacer()
                    }
                    // 4.- circle
                    
                    HStack {
                        ZStack{
                            Circle().fill(Color("ColorRed"))
                            Circle().fill(.black.opacity(0.15))
                                .padding(8)
                            Image(systemName: "chevron.right.2")
                                .font(.system(size: 24, weight: .bold))
                        }.foregroundColor(.white)
                            .frame(width: 80, height: 80, alignment: .center)
                            .offset(x: buttonOffset)
                            .gesture(
                                DragGesture()
                                    .onChanged({ gesture in
                                        if gesture.translation.width > 0 && buttonOffset <= buttonWidth - 80{
                                            buttonOffset = gesture.translation.width
                                        }
                                })
                                    .onEnded({ _ in
                                        withAnimation(Animation.easeOut(duration: 0.4)) {
                                            if buttonOffset > buttonWidth / 2 {
                                                buttonOffset = buttonWidth - 80
                                                isOnboardingViewActive = false
                                            }else {
                                                buttonOffset = 0
                                            }
                                        }
                                    })
                            )//: Gesture
                        Spacer()
                    }//: Hstack
                }//: Footer
                .frame(width: buttonWidth, height: 80, alignment: .center)
                .padding()
                .opacity(isAnimating ? 1 : 0)
                .offset(y: isAnimating ? 0 : 40)
                .animation(.easeOut(duration: 1), value: isAnimating)
            }//: ZStack
        }//: VStack
        .onAppear {
            isAnimating = true
        }
    }
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}
