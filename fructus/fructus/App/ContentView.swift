//
//  ContentView.swift
//  fructus
//
//  Created by Cesar Vargas Tapia on 07/06/23.
//

import SwiftUI

struct ContentView: View {
    // MARK: -  Properties
    @State private var isShowingSettings: Bool = false
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
            .navigationBarItems(trailing: Button(action: {
                isShowingSettings = true
            }, label: {
                Image(systemName: "slider.horizontal.3")
            })//Button
                .sheet(isPresented: $isShowingSettings, content: {
                    SettingsView()
                })
            )
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(fruits: fruitsData)
    }
}
