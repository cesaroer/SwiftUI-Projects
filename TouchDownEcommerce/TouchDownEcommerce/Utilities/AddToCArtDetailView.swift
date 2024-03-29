//
//  AddToCArtDetailView.swift
//  TouchDownEcommerce
//
//  Created by Cesar Vargas Tapia on 11/09/23.
//

import SwiftUI

struct AddToCArtDetailView: View {
    
    @EnvironmentObject var shop: Shop

    var body: some View {
        Button(action: {
          feedback.impactOccurred()
        }, label: {
          Spacer()
          Text("Add to cart".uppercased())
            .font(.system(.title2, design: .rounded))
            .fontWeight(.bold)
            .foregroundColor(.white)
          Spacer()
        }) //: BUTTON
        .padding(15)
        .background(
          Color(
            red: shop.selectedProduct?.red ?? sampleProduct.red,
            green: shop.selectedProduct?.green ?? sampleProduct.green,
            blue: shop.selectedProduct?.blue ?? sampleProduct.blue
          )
        )
        .clipShape(Capsule())
      }
}

struct AddToCArtDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AddToCArtDetailView()
            .environmentObject(Shop())
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
