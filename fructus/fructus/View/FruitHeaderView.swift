//
//  FruitHeaderView.swift
//  fructus
//
//  Created by Cesar Vargas Tapia on 07/06/23.
//

import SwiftUI

struct FruitHeaderView: View {
    var fruit: Fruit
    
    @State private var isanimatingImage:Bool = false
    
    var body: some View {
        ZStack {
            LinearGradient(colors: fruit.gradientColors,
                           startPoint: .topLeading, endPoint: .bottomTrailing)
            Image(fruit.image)
                .resizable()
                .scaledToFit()
                .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15),
                        radius: 8, x: 6, y: 8)
                .padding(.vertical, 20)
                .scaleEffect(isanimatingImage ? 1.0 : 0.6)
            
        }//: ZStack
        .frame(height: 440)
        .onAppear {
            withAnimation(.easeOut(duration: 0.5)) {
                isanimatingImage = true
            }
        }
        .onDisappear {
            isanimatingImage = false
        }
    }
}

struct FruitHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        FruitHeaderView(fruit: fruitsData[0])
            .previewLayout(.fixed(width: 375, height: 440))
    }
}
