//
//  ContentView.swift
//  TouchDownEcommerce
//
//  Created by Cesar Vargas Tapia on 01/09/23.
//

import SwiftUI

struct ContentView: View {
    // MARK: -  Property
    var body: some View {
        ZStack {
            VStack {
                VStack(spacing: 0) {
                    NavigationBarView()
                        .padding(.horizontal, 15)
                        .padding(.bottom)
                        .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                        .background(Color.white)
                        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 5)
                    Spacer()
                    FooterView()
                        .padding(.horizontal)
                }
            }
            .background(colorBackground.ignoresSafeArea(.all,
                                                    edges: .all))
        } //: ZSTACK
        .ignoresSafeArea(.all, edges: .top)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
