//
//  FeatureTabView.swift
//  TouchDownEcommerce
//
//  Created by Cesar Vargas Tapia on 02/09/23.
//

import SwiftUI

struct FeatureTabView: View {
    var body: some View {
        TabView {
          ForEach(players) { player in
            FeaturedItemView(player: player)
              .padding(.top, 10)
              .padding(.horizontal, 15)
          }
        } //: TAB
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
    }
}

struct FeatureTabView_Previews: PreviewProvider {
  static var previews: some View {
      FeatureTabView()
      .background(Color.gray)
  }
}

