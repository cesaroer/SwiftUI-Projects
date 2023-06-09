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
                    // MARK: -  Section 1
                    GroupBox {
                        Divider()
                            .padding(.vertical, 4)
                        
                        HStack(alignment: .center, spacing: 10) {
                            
                            Image("logo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 80)
                                .cornerRadius(9)
                                
                            Text("Most fruits are naturally low in fat, sodium and calories, None have coelestherol, Fruits are cources of many nutrients, incl.")
                                .font(.footnote)
                        }
                    } label: {
                        SettingsLabelView(labelText: "Fructus",
                                          labelImage: "info.circle")
                    }
                    
                    // MARK: -  section 2
                    // MARK: -  section 3
                    
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
