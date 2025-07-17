//
//  ContentView.swift
//  honeymoon
//
//  Created by Cesar Vargas Tapia on 28/06/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HeaderView()
            
            Spacer()
            CardView(honeymoon: honeymoonData[2])
                .padding()
            
            Spacer()
            
            FooterView()
        }
    }
}

#Preview {
    ContentView()
}
