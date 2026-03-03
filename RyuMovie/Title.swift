//
//  Title.swift
//  RyuMovie
//
//  Created by Agus Riyanto on 02/03/26.
//

import Foundation

struct APIObject: Decodable {
    var results: [Title] = []
}

struct Title: Decodable, Identifiable {
    var id: Int?
    var title: String?
    var name: String?
    var overview: String?
    var posterPath: String?
    
    static var previewTitles = [
        Title(id: 1, title: "Kimetsu no Yaiba", name: "Kimetsu no Yaiba", overview: "Movie about a cursed boy who can summon demons.", posterPath: Constants.testTitleURL),
        Title(id: 2, title: "Kimetsu no Yaiba 2", name: "Kimetsu no Yaiba 2", overview: "Movie about a cursed boy who can summon demons", posterPath: Constants.testTitltURL2),
        Title(id: 3, title: "Kimetsu no Yaiba 3", name: "Kimetsu no Yaiba 3", overview: "Movie about a cursed boy who can summon demons", posterPath: Constants.testTitleURL3)
    ]
}
