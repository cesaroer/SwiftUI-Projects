//
//  OnBoardingView.swift
//  fructus
//
//  Created by Cesar Vargas Tapia on 07/06/23.
//

import SwiftUI

struct OnBoardingView: View {
    // MARK: -  Properties
    var fruits: [Fruit] = fruitsData
    
    // MARK: -  Body
    var body: some View {
        TabView {
            ForEach(fruits) { fruit in
                FruitCardView(fruit: fruit, isAnimating: false)
            }//: Loop
        }//: TAB
        .tabViewStyle(.page)
        .padding(.vertical, 20)
    }
}

// MARK: -  Preview
struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView(fruits: fruitsData)
    }
}
