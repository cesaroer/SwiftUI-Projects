//
//  NoteModel.swift
//  Notes Watch App
//
//  Created by Cesar Vargas Tapia on 30/08/23.
//

import Foundation

struct Note: Identifiable, Codable {
  let id: UUID
  let text: String
}
