//
//  SettingsRowView.swift
//  fructus
//
//  Created by Cesar Vargas Tapia on 09/06/23.
//

import SwiftUI

struct SettingsRowView: View {
    var name: String
    var content: String? = nil
    var linkLabel: String? = nil
    var linkDestination: String? = nil
    
    var body: some View {
        VStack {
            Divider().padding(.vertical, 4)
            HStack {
                Text(name)
                    .foregroundColor(.gray)
                Spacer()
                if (content != nil) {
                    Text(content!)
                } else if  (linkLabel != nil
                            && linkDestination != nil
                            && URL(string: "https://\(linkDestination!)") != nil ){
                    
                    Link(linkLabel!,
                         destination: URL(string: "https://\(linkDestination!)")!)
                    Image(systemName: "arrow.up.right.square").foregroundColor(.pink)
                }else {
                    /*@START_MENU_TOKEN@*/EmptyView()/*@END_MENU_TOKEN@*/
                }
            }
        }
    }
}

struct SettingsRowView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsRowView(name:"Developer" , content: "John / Jane")
            .previewLayout(.sizeThatFits)
            .padding()
        
        SettingsRowView(name: "Website",
                        linkLabel: "SwiftUI Masterclass",
                        linkDestination: "www.google.com")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
