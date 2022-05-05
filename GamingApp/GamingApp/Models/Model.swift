//
//  Model.swift
//  GamingApp
//
//  Created by LMCM on 3/31/22.
//

import Foundation

struct Game: Hashable, Decodable {
    let title, studio, contentRaiting, publicationYear, welcomeDescription: String
    let platforms, tags, galleryImages: [String]
    let videosUrls: VideosUrls

    enum CodingKeys: String, CodingKey {
        case title, studio, contentRaiting, publicationYear
        case welcomeDescription = "description"
        case platforms, tags, videosUrls, galleryImages
    }
}

struct GameResults: Decodable, Hashable {
    var results: [Game]
}

struct VideosUrls: Hashable, Decodable {
    let mobile, tablet: String
}
