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
            VStack(spacing: 0) {
                NavigationBarView()
                    .padding(.horizontal, 15)
                    .padding(.bottom)
                    .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                    .background(Color.white)
                    .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 5)
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing:0 ) {
                        FeatureTabView()
                            .frame(height: UIScreen.main.bounds.width / 1.475) // This will fix the layout rendering priority issue by using the screen's aspect ratio.
                            .padding(.vertical, 20)
                        
                        CategoryGridView()
                        
                        TitleView(title: "Helmets")
                        
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 15) {
                            ForEach(products) { product in
                                ProductItemView(product: product)
                            }
                        }.padding(15)
                        
                        TitleView(title: "Brands")
                        
                        BrandGridView()
                        
                        FooterView()
                            .padding(.horizontal)
                    }// VStack
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
            .previewLayout(.device)
    }
}
