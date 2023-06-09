//
//  SettingsView.swift
//  fructus
//
//  Created by Cesar Vargas Tapia on 09/06/23.
//

import SwiftUI

struct SettingsView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @AppStorage("isOnboarding") var isOnboarding: Bool = true
    
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
                    GroupBox {
                        Divider().padding(.vertical, 4)
                        Text("If you wish you can switch here, by switching the switch jeje, and more more more texto text blah blah blah, thanks")
                            .padding(.vertical, 8)
                            .frame(minWidth: 60)
                            .layoutPriority(1)
                            .font(.footnote)
                            .multilineTextAlignment(.leading)
                        
                        
                        Toggle(isOn: $isOnboarding) {
                            if isOnboarding {
                                Text("Restarted".uppercased())
                                    .fontWeight(.bold)
                                    .foregroundColor(.green)
                            } else {
                                Text("Restart".uppercased())
                                    .fontWeight(.bold)
                                    .foregroundColor(.secondary)
                            }
                        }
                        .padding()
                        .background(
                            Color(uiColor: UIColor.tertiarySystemBackground)
                                .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                        )
                        
                    } label: {
                        SettingsLabelView(labelText: "Customization", labelImage: "paintbrush")
                    }

                    
                    // MARK: -  section 3
                    GroupBox {
                        
                        SettingsRowView(name:"Developer" , content: "John / Jane")
                        SettingsRowView(name:"Designer" , content: "John / Jane again")

                        SettingsRowView(name:"Compatibility" , content: "iOS 14")
                        SettingsRowView(name: "Website",
                                        linkLabel: "SwiftUI Masterclass",
                                        linkDestination: "www.google.com")
                        SettingsRowView(name: "Twitter",
                                        linkLabel: "@someting",
                                        linkDestination: "twitter.com")
                        SettingsRowView(name:"SwiftUI" , content: "1.1.0")

                        
                    } label: {
                        SettingsLabelView(labelText: "Application",
                                          labelImage: "apps.iphone")
                    }

                    
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
