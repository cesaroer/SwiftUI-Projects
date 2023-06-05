//
//  infoPanelView.swift
//  Pinch
//
//  Created by Cesar Vargas Tapia on 05/06/23.
//

import SwiftUI

struct infoPanelView: View {
    
    @State private var isPanelVisible: Bool = false

    var scale: CGFloat
    var offset: CGSize
    
    var body: some View {
        HStack {
            // MARK: -  HotSpot
            Image(systemName: "circle.circle")
                .symbolRenderingMode(.hierarchical)
                .resizable()
                .frame(width: 30, height: 30)
                .onLongPressGesture(minimumDuration: 1) {
                    withAnimation(.easeOut) {
                        isPanelVisible.toggle()
                    }
                }
            Spacer()
            
            // MARK: -  Info Panel
            HStack( spacing: 2) {
                Image(systemName: "arrow.up.left.and.arrow.down.right")
                Text("\(scale)")
                Spacer()
        
                Image(systemName: "arrow.left.and.right")
                Text("\(offset.width)")
                Spacer()

                Image(systemName: "arrow.up.and.down")
                Text("\(offset.height)")
                Spacer()

            }.font(.footnote)
                .padding(8)
                .background(.ultraThinMaterial)
                .cornerRadius(8)
                .frame(maxWidth: 420)
                .opacity(isPanelVisible ? 1 : 0)
            
            Spacer()
        }
    }
}

struct infoPanelView_Previews: PreviewProvider {
    static var previews: some View {
        infoPanelView(scale: 1, offset: .zero)
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
