//
//  AnimalModel.swift
//  AfricaApp
//
//  Created by Cesar Vargas Tapia on 12/06/23.
//

import SwiftUI

struct Animal: Codable, Identifiable {
  let id: String
  let name: String
  let headline: String
  let description: String
  let link: String
  let image: String
  let gallery: [String]
  let fact: [String]
}

