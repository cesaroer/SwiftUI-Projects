//
//  NavigationBarView.swift
//  TouchDownEcommerce
//
//  Created by Cesar Vargas Tapia on 02/09/23.
//

import SwiftUI

struct NavigationBarView: View {
    
    // MARK: - PROPERTY
    @State private var isAnimated: Bool = false
    
    var body: some View {
        HStack {
            Button(action: {}, label: {
                Image(systemName: "magnifyingglass")
                    .font(.title)
                    .foregroundColor(.black)
            }) //: BUTTON
            
            Spacer()
            LogoView()
                .opacity(isAnimated ? 1 : 0)
                .offset(x: 0, y: isAnimated ? 0 : -25)
                .onAppear {
                    withAnimation(.easeOut(duration: 0.9)) {
                        isAnimated.toggle()
                    }
                }
            Spacer()
            
            Button(action: {}, label: {
              ZStack {
                Image(systemName: "cart")
                  .font(.title)
                  .foregroundColor(.black)
                  
                  // Circle notification
                  Circle()
                      .fill(Color.red)
                      .frame(width: 14, height: 14, alignment: .center)
                      .offset(x: 13, y: -10)
              }
            })
        }
    }
}

struct NavigationBarView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarView().padding()
    }
}
