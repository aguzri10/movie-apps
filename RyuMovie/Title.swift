//
//  Title.swift
//  RyuMovie
//
//  Created by Agus Riyanto on 02/03/26.
//

import SwiftData

struct TMDBAPIObject: Decodable {
    var results: [Title] = []
}

@Model
class Title: Decodable, Identifiable, Hashable {
    @Attribute(.unique) var id: Int?
    var title: String?
    var name: String?
    var overview: String?
    var posterPath: String?
    
    init(id: Int? = nil, title: String? = nil, name: String? = nil, overview: String? = nil, posterPath: String? = nil) {
        self.id = id
        self.title = title
        self.name = name
        self.overview = overview
        self.posterPath = posterPath
    }
    
    enum CodingKeys: CodingKey {
        case id
        case title
        case name
        case overview
        case posterPath
    }
    
    required init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(Int.self, forKey: .id)
        title = try container.decodeIfPresent(String.self, forKey: .title)
        name = try container.decodeIfPresent(String.self, forKey: .name)
        overview = try container.decodeIfPresent(String.self, forKey: .overview)
        posterPath = try container.decodeIfPresent(String.self, forKey: .posterPath)
    }
    
    static var previewTitles = [
        Title(id: 1, title: "Kimetsu no Yaiba", name: "Kimetsu no Yaiba", overview: "Movie about a cursed boy who can summon demons.", posterPath: Constants.testTitleURL),
        Title(id: 2, title: "Kimetsu no Yaiba 2", name: "Kimetsu no Yaiba 2", overview: "Movie about a cursed boy who can summon demons", posterPath: Constants.testTitltURL2),
        Title(id: 3, title: "Kimetsu no Yaiba 3", name: "Kimetsu no Yaiba 3", overview: "Movie about a cursed boy who can summon demons", posterPath: Constants.testTitleURL3)
    ]
}
