//
//  DetailGameModel.swift
//  game-app
//
//  Created by Magistra Apta on 04/01/24.
//


// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let detailGameModel = try? JSONDecoder().decode(DetailGameModel.self, from: jsonData)

import Foundation

// MARK: - DetailGameModel
struct DetailGameModel: Codable {
    let id: Int
    let slug, name, nameOriginal, description: String
    let backgroundImage: String
    let released: String

    enum CodingKeys: String, CodingKey {
        case id, slug, name
        case nameOriginal = "name_original"
        case description
        case backgroundImage = "background_image"
        case released
    }
}


