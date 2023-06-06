//
//  ContentView.swift
//  Pinch
//
//  Created by Cesar Vargas Tapia on 04/06/23.
//

import SwiftUI

struct ContentView: View {
    // MARK: -  Property
    @State private var isAnimating: Bool = false
    @State private var imageScale: CGFloat = 1
    @State private var imageOffset: CGSize = .zero
    @State private var isDrawerOpen: Bool = false

    // MARK: -  function
    func resetImageState() {
        return withAnimation(.spring()) {
            imageScale = 1
            imageOffset = .zero
        }
    }

// MARK: -  Content
    var body: some View {
        NavigationView {
            ZStack {
                Color.clear
                // MARK: -  PAge Image
                let image = #imageLiteral(resourceName: "magazine-front-cover")
                Image(uiImage: image).resizable()
                    .aspectRatio( contentMode: .fit)
                    .cornerRadius(10)
                    .padding()
                    .shadow(color: .black.opacity(0.2), radius: 12, x: 2, y: 2)
                    .opacity(isAnimating ? 1 : 0)
                    .offset(x: imageOffset.width, y: imageOffset.height )
                    .scaleEffect(imageScale)
                    .onTapGesture(count: 2, perform: {
                        if imageScale == 1 {
                            withAnimation(.spring()) {
                                imageScale = 5
                            }
                        }else {
                            resetImageState()
                        }
                    })
                    
                // MARK: -  Drag Gesture
                    .gesture(DragGesture()
                        .onChanged { value in
                            withAnimation(.linear(duration: 1)) {
                                imageOffset = value.translation
                            }
                        }
                        .onEnded{ _ in
                            if imageScale <= 1 {
                                resetImageState()
                            }
                        }
                    )
                // MARK: -  Magnification
                    .gesture(
                        MagnificationGesture()
                            .onChanged { value in
                                withAnimation(.linear(duration: 1)) {
                                    if imageScale >= 1 && imageScale <= 5{
                                        imageScale = value
                                    } else if imageScale > 5 {
                                        imageScale = 5
                                    }
                                }
                            }
                            .onEnded{ _ in
                                if imageScale > 5 {
                                    imageScale = 5
                                } else if imageScale <= 1 {
                                    resetImageState()
                                }
                            }
                    )
            }
            .navigationTitle("Pinch & Zoom")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                withAnimation(.linear(duration: 1)) {
                    isAnimating = true
                }
            }
            // MARK: -  InfoPanel
            .overlay(alignment: .top) {
                infoPanelView(scale: imageScale, offset: imageOffset)
                    .padding(.horizontal)
                    .padding(.top, 30)
            }
            // MARK: -  Controls
            .overlay (
                Group {
                    HStack {
                        //Scale Down
                        Button {
                            withAnimation(.spring()) {
                                if imageScale > 1 {
                                    imageScale -= 1
                                    
                                    if imageScale <= 1 {
                                        resetImageState()
                                    }
                                }
                            }
                        } label: {
                            ConstrolImageView(icon: "minus.magnifyingglass")
                        }
                        
                        // Reset
                        
                        Button {
                            resetImageState()
                        } label: {
                            ConstrolImageView(icon: "arrow.up.left.and.down.right.magnifyingglass")
                        }
                        
                        //Scale Up
                        Button {
                            withAnimation(.spring()) {
                                if imageScale < 5 {
                                    imageScale += 1
                                    
                                    if imageScale > 5 {
                                        imageScale = 5
                                    }
                                }
                            }
                        } label: {
                            ConstrolImageView(icon: "plus.magnifyingglass")
                        }
                        
                    }//: Controls
                    .padding(EdgeInsets(top: 12, leading: 20, bottom: 12, trailing: 20))
                    .background(.ultraThinMaterial)
                    .cornerRadius(12)
                    .opacity(isAnimating ? 1 : 0)
                }.padding(.bottom, 30)
                , alignment: .bottom
            )
            
            // MARK: -  Drawer
            .overlay(
                HStack(spacing: 12) {
                    // MARK: -  DRAWER HANDLE
                    
                    Image(systemName: isDrawerOpen ? "chevron.compact.right": "chevron.compact.left")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 40)
                        .padding(8)
                        .foregroundStyle(.secondary)
                        .onTapGesture {
                            withAnimation(.easeOut) {
                                isDrawerOpen.toggle()
                            }
                        }
                    // MARK: -  THUMBNAILS
                    
                    Spacer()
                }// Drawer
                    .padding(EdgeInsets(top: 16, leading: 8, bottom: 16, trailing: 8))
                    .background(.ultraThinMaterial)
                    .cornerRadius(12)
                    .opacity(isAnimating ? 1 : 0)
                    .frame(width: 260)
                    .padding(.top, UIScreen.main.bounds.height / 12)
                    .offset(x: isDrawerOpen ? 20 : 215)
                , alignment: .topTrailing)
        }.navigationViewStyle(.stack)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
