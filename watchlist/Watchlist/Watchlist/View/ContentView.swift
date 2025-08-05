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
            ForEach(movies) { movie in
                HStack {
                    Text(movie.title)
                    
                    Spacer()
                    
                    Text(movie.genre.name)
                }
                .swipeActions {
                    Button(role: .destructive) {
                        withAnimation {
                            modelContext.delete(movie)
                        }
                    } label: {
                        Label("Delete", systemImage: "trash")
                    }
                }
            }
        }
        .overlay {
            if movies.isEmpty {
                EmptyListView()
            }
        }
        
        // MARK: -  SAfeArea
        .safeAreaInset(edge: .bottom, alignment: .center) {
            Button {
                isSheetPresented.toggle()
            } label: {
                ButtonImageView(symbolName: "plus.circle.fill")
            }

        }
        
        // MARK: -  Sheet
        .sheet(isPresented: $isSheetPresented) {
            NewMovieFormView()
        }
        
    }
}

#Preview("Sample Data") {
  ContentView()
    .modelContainer(Movie.preview)
}


#Preview {
    ContentView()
}
