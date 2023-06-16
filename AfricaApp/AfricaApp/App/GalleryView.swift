//
//  GalleryView.swift
//  AfricaApp
//
//  Created by Cesar Vargas Tapia on 12/06/23.
//

import SwiftUI

struct GalleryView: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            Text("Gallery")
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(MotionAnimationView())
    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
