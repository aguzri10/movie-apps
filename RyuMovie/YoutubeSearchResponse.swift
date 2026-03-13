//
//  YoutubeSearchResponse.swift
//  RyuMovie
//
//  Created by Agus Riyanto on 04/03/26.
//

import Foundation

struct YoutubeSearchResponse: Codable {
    let items: [ItemProperties]?
}

struct ItemProperties: Codable {
    let id: IdProperties?
}

struct IdProperties: Codable {
    let videoId: String?
}
