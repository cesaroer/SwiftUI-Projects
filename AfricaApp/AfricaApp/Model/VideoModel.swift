//
//  VideoModel.swift
//  AfricaApp
//
//  Created by Cesar Vargas Tapia on 16/06/23.
//

import Foundation

struct Video: Codable, Identifiable {
  let id: String
  let name: String
  let headline: String
  
  // Computed Property
  var thumbnail: String {
    "video-\(id)"
  }
}

