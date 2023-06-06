//
//  ConstrolImageView.swift
//  Pinch
//
//  Created by Cesar Vargas Tapia on 05/06/23.
//

import SwiftUI

struct ConstrolImageView: View  {
    let icon: String
    
    var body: some View {
        Image(systemName: icon)
            .font(.system(size: 36))
    }
}

struct ConstrolImageView_Previews: PreviewProvider {
    static var previews: some View {
        ConstrolImageView(icon: "minus.magnifyingglass")
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
