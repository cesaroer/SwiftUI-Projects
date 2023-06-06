//
//  PageModel.swift
//  Pinch
//
//  Created by Cesar Vargas Tapia on 05/06/23.
//

import Foundation

public struct Page: Identifiable {
    public let id: Int
    public let imageName: String
}

extension Page {
    public var thumbnailName: String {
        return "thumb-" + imageName
    }
}
