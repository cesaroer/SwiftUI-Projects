//
//  WatchlistApp.swift
//  Watchlist
//
//  Created by Cesar Vargas Tapia on 30/07/25.
//

import SwiftUI
import SwiftData

@main
struct WatchlistApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Movie.self)
        }
    }
}
