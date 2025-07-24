//
//  ContentView.swift
//  honeymoon
//
//  Created by Cesar Vargas Tapia on 28/06/25.
//

import SwiftUI

struct ContentView: View {
    @State var showAlert: Bool = false
    @State var showGuide: Bool = false
    @State var showInfo: Bool = false
    
    // MARK: -  CArd Views
    var cardViews: [CardView] = {
        return honeymoonData.prefix(2).map { CardView(honeymoon: $0) }
    }()

    // MARK: -  Top Card
    private func isTopCard(cardView: CardView) -> Bool {
        guard let index = cardViews.firstIndex(where: { $0.id == cardView.id }) else {
            return false
        }
        
        return index == 0
    }

    var body: some View {
        VStack {
            HeaderView(showGuideView: $showGuide, showInfoView: $showInfo)
            
            Spacer()
            // MARK: -  CARDS
            ZStack(alignment: .topLeading) {
                ForEach(cardViews) { cardView in
                    cardView
                        .zIndex(self.isTopCard(cardView: cardView) ? 1 : 0)
                }
            }
            .padding(.horizontal)
            
            Spacer()
            
            FooterView(showBookingAlert: $showAlert)
        }
        .alert(isPresented: $showAlert){
            Alert(
                title: Text("SUCCESS"),
                message: Text("Wishing a lovely and most precious of the times together for the amazing couple."),
                dismissButton: .default(Text("Happy Honeymoon!")))
        }
    }
}


#Preview {
    ContentView()
}
