//
//  Model.swift
//  GamingApp
//
//  Created by LMCM on 3/31/22.
//

import Foundation

// Cada struct equivale a un Json {}
struct Game: Hashable, Decodable {
    let title, studio, contentRaiting, publicationYear: String
    let welcomeDescription: String
    let platforms, tags: [String]
    let videosUrls: VideosUrls
    let galleryImages: [String]

    enum CodingKeys: String, CodingKey {
        case title, studio, contentRaiting, publicationYear
        case welcomeDescription = "description"
        case platforms, tags, videosUrls, galleryImages
    }
}

// MARK: - VideosUrls
struct VideosUrls: Hashable, Decodable {
    let mobile, tablet: String
}
