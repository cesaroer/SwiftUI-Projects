//
//  ProductDetailView.swift
//  TouchDownEcommerce
//
//  Created by Cesar Vargas Tapia on 05/09/23.
//

import SwiftUI

struct ProductDetailView: View {
    // MARK: - PROPERTY
    @EnvironmentObject var shop: Shop
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            // NAVBAR
            NavigationBarDetailView()
              .padding(.horizontal)
              .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
            
            // HEADER
            HeaderDetailView()
                .padding(.horizontal)
            
            // DETAIL TOP PART
            TopPartDetailView()
                .padding(.horizontal)
                .zIndex(1)
            
            // DETAIL BOTTOM PART
            
            VStack (alignment: .center, spacing: 0) {
                // RATINGS + SIZES
                RatingsSizesDetailView()
                    .padding(.top, -20)
                    .padding(.bottom, 10)
                
                // DESCRIPTION
                ScrollView(.vertical, showsIndicators: false, content: {
                    Text(shop.selectedProduct?.description ?? sampleProduct.description)
                      .font(.system(.body, design: .rounded))
                      .foregroundColor(.gray)
                      .multilineTextAlignment(.leading)
                }) //: SCROLL

                
                // QUANTITY + FAVOURITE
                QuantityFavoriteDetailView()
                    .padding(.vertical,20)
   
                
                // ADD TO CART
                
                AddToCArtDetailView()
                    .padding(.bottom, 20)
                  Spacer()
            }
            .padding(.horizontal)
            .background(
              Color.white
                .clipShape(CustomShape())
                .padding(.top, -105)
            )
        }
        .zIndex(0)
        .ignoresSafeArea(.all, edges: .all)
        .background(
          Color(
            red: shop.selectedProduct?.red ?? sampleProduct.red,
            green: shop.selectedProduct?.green ?? sampleProduct.green,
            blue: shop.selectedProduct?.blue ?? sampleProduct.blue
          ).ignoresSafeArea(.all, edges: .all)
        )
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView()
            .environmentObject(Shop())
    }
}
