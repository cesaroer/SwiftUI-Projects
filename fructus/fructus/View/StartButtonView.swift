//
//  StartButtonView.swift
//  fructus
//
//  Created by Cesar Vargas Tapia on 07/06/23.
//

import SwiftUI

struct StartButtonView: View {
    // MARK: -  Props
    // MARK: -  Body
    var body: some View {
        Button {
            print("Exit the on boarding")
        } label: {
            HStack(spacing: 8) {
                Text("Start")
                Image(systemName: "arrow.right.circle")
                    .imageScale(.large)
                
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            .background(
                Capsule().strokeBorder(.white, lineWidth: 1.25)
            )
        }//: Button
        .accentColor(.white)

    }
}

// MARK: -  Preview
struct StartButtonView_Previews: PreviewProvider {
    static var previews: some View {
        StartButtonView()
            .previewLayout(.sizeThatFits)
    }
}
