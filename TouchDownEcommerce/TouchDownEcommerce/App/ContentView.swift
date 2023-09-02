//
//  ContentView.swift
//  TouchDownEcommerce
//
//  Created by Cesar Vargas Tapia on 01/09/23.
//

import SwiftUI

struct ContentView: View {
    // MARK: -  Property
    var body: some View {
        VStack {
            FooterView()
                .padding(.horizontal)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
