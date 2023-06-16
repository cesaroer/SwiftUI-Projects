//
//  VideoListView.swift
//  AfricaApp
//
//  Created by Cesar Vargas Tapia on 12/06/23.
//

import SwiftUI

struct VideoListView: View {
    @State var videos: [Video] = Bundle.main.decode("videos.json")
    let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
    
    var body: some View {
        NavigationView {
          List {
            ForEach(videos) { item in
              NavigationLink(destination:
                                VideoPlayerView(videoSelected: item.id,
                                                videoTitle: item.name)) {
                VideoListItemView(video: item)
                  .padding(.vertical, 8)
              }
            } //: LOOP
          } //: LIST
          .listStyle(InsetGroupedListStyle())
          .navigationBarTitle("Videos", displayMode: .inline)
          .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
              Button(action: {
                // Shuffle videos
                videos.shuffle()
                hapticImpact.impactOccurred()
              }) {
                Image(systemName: "arrow.2.squarepath")
              }
            }
          }
        } //: NAVIGATION
    }
}

struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}
