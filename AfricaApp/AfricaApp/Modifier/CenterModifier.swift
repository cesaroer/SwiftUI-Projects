//
//  CenterModifier.swift
//  AfricaApp
//
//  Created by Cesar Vargas Tapia on 19/06/23.
//

import SwiftUI

struct CenterModifier: ViewModifier {
  func body(content: Content) -> some View {
    HStack {
      Spacer()
      content
      Spacer()
    }
  }
}
