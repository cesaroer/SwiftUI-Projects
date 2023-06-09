//
//  SettingsView.swift
//  fructus
//
//  Created by Cesar Vargas Tapia on 09/06/23.
//

import SwiftUI

struct SettingsView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: true) {
                VStack(spacing: 20) {
                    Text("Hello")
                }//Vstack
                .navigationTitle("Settings")
                .navigationBarTitleDisplayMode(.large)
                .navigationBarItems(trailing: Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "xmark")
                }))
                .padding()
            }// Scroll
        }//Nav
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .preferredColorScheme(.dark)
    }
}
