//
//  CategoryGridView.swift
//  TouchDownEcommerce
//
//  Created by Cesar Vargas Tapia on 05/09/23.
//

import SwiftUI

import SwiftUI

struct CategoryGridView: View {
  // MARK: - PROPERTY
  
  // MARK: - BODY
  
  var body: some View {
    ScrollView(.horizontal, showsIndicators: false, content: {
      LazyHGrid(rows: gridLayout, alignment: .center, spacing: columnSpacing, pinnedViews: [], content: {
        Section(
          header: SectionView(rotateClockwise: false),
          footer: SectionView(rotateClockwise: true)
        ) {
          ForEach(categories) { category in
            CategoryItemView(category: category)
          }
        }
      }) //: GRID
      .frame(height: 140)
      .padding(.horizontal, 15)
      .padding(.vertical, 10)
    }) //: SCROLL
  }
}

// MARK: - PREVIEW

struct CategoryGridView_Previews: PreviewProvider {
  static var previews: some View {
    CategoryGridView()
      .previewLayout(.device)
      .padding()
      .background(colorBackground)
  }
}
