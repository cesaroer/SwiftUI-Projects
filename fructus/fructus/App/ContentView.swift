//
//  ContentView.swift
//  fructus
//
//  Created by Cesar Vargas Tapia on 07/06/23.
//

import SwiftUI

struct ContentView: View {
    // MARK: -  Properties
    var fruits: [Fruit] = fruitsData

    var body: some View {
        NavigationView {
            List(fruits.shuffled()) { fruit in
                NavigationLink(destination: FruitDetalView(fruit: fruit)) {
                    FruitRowView(fruit: fruit)
                        .padding(.vertical, 4)
                }
            }
            .navigationTitle("Fruits")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(fruits: fruitsData)
    }
}
