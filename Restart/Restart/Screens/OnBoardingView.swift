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
                
                // MARK: -  CENTER
                ZStack {
                    CircleGroupView(ShapeColor: .white,
                                    ShapeOpacity: 0.2)

                   let image =  #imageLiteral(resourceName: "character-1")
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
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
                            .frame(width: 80)
                        
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
                            .onTapGesture {
                                isOnboardingViewActive = false
                            }
                        Spacer()
                    }//: Hstack
                }//: Footer
                .frame(height: 80, alignment: .center)
                .padding()
            }//: ZStack
        }//: VStack
    }
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}
