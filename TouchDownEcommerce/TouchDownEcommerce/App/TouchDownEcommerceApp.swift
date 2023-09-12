//
//  TouchDownEcommerceApp.swift
//  TouchDownEcommerce
//
//  Created by Cesar Vargas Tapia on 01/09/23.
//

import SwiftUI

@main
struct TouchDownEcommerceApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(Shop())
        }
    }
}
