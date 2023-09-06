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
            
            
            // DETAIL BOTTOM PART
              // RATINGS + SIZES

              
              // DESCRIPTION

              
              // QUANTITY + FAVOURITE
 
              
              // ADD TO CART
                Spacer()
        }
        .ignoresSafeArea(.all, edges: .all)
        .background(
          Color(
            red: sampleProduct.red,
            green:  sampleProduct.green,
            blue: sampleProduct.blue
          ).ignoresSafeArea(.all, edges: .all)
        )
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView()
    }
}
