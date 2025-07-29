//
//  ContentView.swift
//  honeymoon
//
//  Created by Cesar Vargas Tapia on 28/06/25.
//

import SwiftUI

public enum DragState {
    case inactive
    case pressing
    case dragging(translation: CGSize)

    var translation: CGSize {
        switch self {
        case .inactive, .pressing:
            return .zero
        case .dragging(let translation):
            return translation
        }
    }

    var isDragging: Bool {
        switch self {
        case .inactive, .pressing:
            return false
        case .dragging:
            return true
        }
    }

    var isPressing: Bool {
        switch self {
        case .inactive:
            return false
        case .pressing, .dragging:
            return true
        }
    }
}

struct ContentView: View {
    @State var showAlert: Bool = false
    @State var showGuide: Bool = false
    @State var showInfo: Bool = false
    @GestureState private var dragState = DragState.inactive
    private var dragAreaThreshold: CGFloat = 75.0
    @State private var lastCardIndex: Int = 1
    @State private var cardRemovalTransition = AnyTransition.trailingBottom
    @State private var isCardBeingRemoved: Bool = false

    // MARK: -  CArd Views
    @State var cardViews: [CardView] = {
        return honeymoonData.prefix(2).map { CardView(honeymoon: $0) }
    }()

    // MARK: -  Move Card
    private func moveCards() {
        cardViews.removeFirst()
        self.lastCardIndex += 1
        let hm = honeymoonData[lastCardIndex % honeymoonData.count]
        let newCardView = CardView(honeymoon: hm)
        cardViews.append(newCardView)
    }

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
                .opacity(dragState.isDragging ? 0.0 : 1.0)
                .animation(.default)
            Spacer()
            // MARK: -  CARDS
            ZStack(alignment: .topLeading) {
                ForEach(cardViews) { cardView in
                    cardView
                        .zIndex(self.isTopCard(cardView: cardView) ? 1 : 0)
                        .overlay(content: {
                            ZStack {
                                Image(systemName: "x.circle")
                                    .modifier(SymbolModifier())
                                    .opacity(self.dragState.translation.width < -self.dragAreaThreshold && self.isTopCard(cardView: cardView) ? 1.0 : 0)
                                
                                Image(systemName: "heart.circle")
                                    .modifier(SymbolModifier())
                                    .opacity(self.dragState.translation.width  > self.dragAreaThreshold && self.isTopCard(cardView: cardView) ? 1.0 : 0)
                            }
                        })
                        .offset(x: self.isTopCard(cardView: cardView) ? self.dragState.translation.width : 0, y: self.isTopCard(cardView: cardView) ?  self.dragState.translation.height : 0)
                        .scaleEffect(self.dragState.isDragging && self.isTopCard(cardView: cardView) ? 0.85 : 1.0)
                        .rotationEffect(Angle(degrees: self.isTopCard(cardView: cardView) ? (self.dragState.translation.width / 12) : 0 ))
                        .opacity(
                            self.isTopCard(cardView: cardView) &&
                            (abs(self.dragState.translation.width) > self.dragAreaThreshold || self.isCardBeingRemoved)
                            ? 0.5 : 1.0
                        )
                        .animation(.interpolatingSpring(stiffness: 120, damping: 120))
                        .gesture(
                            LongPressGesture(minimumDuration: 0.01)
                                .sequenced(before: DragGesture())
                                .updating(self.$dragState, body: { (value, state, transaction) in
                                  switch value {
                                  case .first(true):
                                    state = .pressing
                                  case .second(true, let drag):
                                    state = .dragging(translation: drag?.translation ?? .zero)
                                  default:
                                    break
                                  }
                                })
                                .onChanged({ (value) in
                                  guard case .second(true, let drag?) = value else {
                                    return
                                  }
                                  
                                  if drag.translation.width < -self.dragAreaThreshold {
                                    self.cardRemovalTransition = .leadingBottom
                                  }
                                  
                                  if drag.translation.width > self.dragAreaThreshold {
                                    self.cardRemovalTransition = .trailingBottom
                                  }
                                })
                                .onEnded({ (value) in
                                    guard case .second(true, let drag?) = value else {
                                      return
                                    }
                                                                        
                                    if drag.translation.width < -self.dragAreaThreshold || drag.translation.width > self.dragAreaThreshold {
                                      playSound(sound: "sound-rise", type: "mp3")
                                        
                                        self.isCardBeingRemoved = true

                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
                                            self.moveCards()
                                            self.isCardBeingRemoved = false
                                        }
                                    }
                                  })
                        ).transition(self.cardRemovalTransition)
                }
            }
            .padding(.horizontal)
            
            Spacer()
            
            FooterView(showBookingAlert: $showAlert)
                .opacity(dragState.isDragging ? 0.0 : 1.0)
                .animation(.default)
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
