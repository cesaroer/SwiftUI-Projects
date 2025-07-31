//
//  ContentView.swift
//  Watchlist
//
//  Created by Cesar Vargas Tapia on 30/07/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    // MARK: -  Properties
    @Environment(\.modelContext) var modelContext
    @Query private var movies: [Movie]
    
    @State private var isSheetPresented: Bool = false
    @State private var randomMovie: String = ""
    @State private var isShowingAlert: Bool = false

    var body: some View {
        List {
            
        }
        .overlay {
            if movies.isEmpty {
                EmptyListView()
            }
        }
    }
}

#Preview {
    ContentView()
}
