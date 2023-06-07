//
//  FruitCardView.swift
//  fructus
//
//  Created by Cesar Vargas Tapia on 07/06/23.
//

import SwiftUI

struct FruitCardView: View {
    // MARK: -  Properties
    var fruit: Fruit
    @State public var isAnimating: Bool = false
    
    init(fruit: Fruit, isAnimating: Bool) {
        self.fruit = fruit
        self.isAnimating = isAnimating
    }

    // MARK: -  Body
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                //  Fruit: Image
                Image(fruit.image)
                    .resizable()
                    .scaledToFit()
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15),
                            radius: 8, x: 6, y: 8)
                    .scaleEffect(isAnimating ? 1 : 0.6)
                //  Fruit: title
                Text(fruit.title)
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .shadow(color: Color( red: 0, green: 0, blue: 0, opacity: 0.15), radius: 2, x: 2, y: 2)
                
                //  Fruit: HeadLine
                Text(fruit.headline)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 16)
                    .frame(maxWidth: 480)
                
                //  Btn: start
                StartButtonView()
            }//: VSTACK
        }//: ZSTACK
        .onAppear {
            isAnimating = false
            DispatchQueue.main.async {
                withAnimation(.easeOut(duration: 0.5)){
                    isAnimating = true
                }
            }
        }.onDisappear(){
            isAnimating = false
        }
        .frame(minWidth: 0, maxWidth: .infinity,
               minHeight: 0, maxHeight: .infinity, alignment: .center)
        .background(LinearGradient(gradient:
                                    Gradient(colors: fruit.gradientColors),
                                   startPoint: .top, endPoint: .bottom))
        .cornerRadius(20)
        .padding(.horizontal, 20)
    }
}

// MARK: -  Preview
struct FruitCardView_Previews: PreviewProvider {
    static var previews: some View {
        FruitCardView(fruit: fruitsData[1], isAnimating: false)
            .previewLayout(.fixed(width: 320, height: 640))
    }
}
