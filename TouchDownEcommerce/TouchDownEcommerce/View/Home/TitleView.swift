//
//  TitleView.swift
//  TouchDownEcommerce
//
//  Created by Cesar Vargas Tapia on 05/09/23.
//

import SwiftUI

struct TitleView: View {
  // MARK: - PREVIEW
  
  var title: String
  
  // MARK: - BODY
  
  var body: some View {
    HStack {
      Text(title)
        .font(.largeTitle)
        .fontWeight(.heavy)
      
      Spacer()
    } //: HSTACK
    .padding(.horizontal)
    .padding(.top, 15)
    .padding(.bottom, 10)
  }
}

// MARK: - PREVIEW

struct TitleView_Previews: PreviewProvider {
  static var previews: some View {
    TitleView(title: "Helmet")
      .previewLayout(.sizeThatFits)
      .background(colorBackground)
  }
}
