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

// MARK: - AddedByStatus
//struct AddedByStatus: Codable {
//    let yet, owned, beaten, toplay: Int
//    let dropped, playing: Int
//}

// MARK: - Developer
//struct Developer: Codable {
//    let id: Int
//    let name, slug: String
//    let gamesCount: Int
//    let imageBackground: String
//    let domain: String?
////    let language: Language?
//
//    enum CodingKeys: String, CodingKey {
//        case id, name, slug
//        case gamesCount = "games_count"
//        case imageBackground = "image_background"
//        case domain
//    }
//}

//enum Language: String, Codable {
//    case eng = "eng"
//}
//
//// MARK: - EsrbRating
//struct EsrbRating: Codable {
//    let id: Int
//    let name, slug: String
//}

// MARK: - MetacriticPlatform
//struct MetacriticPlatform: Codable {
//    let metascore: Int
//    let url: String
//    let platform: MetacriticPlatformPlatform
//}
//
//// MARK: - MetacriticPlatformPlatform
//struct MetacriticPlatformPlatform: Codable {
//    let platform: Int
//    let name, slug: String
//}

//// MARK: - ParentPlatform
//struct ParentPlatform: Codable {
//    let platform: EsrbRating
//}

//// MARK: - PlatformElement
//struct PlatformElement: Codable {
//    let platform: PlatformPlatform
//    let releasedAt: String
//    let requirements: Requirements
//
//    enum CodingKeys: String, CodingKey {
//        case platform
//        case releasedAt = "released_at"
//        case requirements
//    }
//}

// MARK: - PlatformPlatform
//struct PlatformPlatform: Codable {
//    let id: Int
//    let name, slug: String
//    let image, yearEnd: JSONNull?
//    let yearStart: Int?
//    let gamesCount: Int
//    let imageBackground: String
//
//    enum CodingKeys: String, CodingKey {
//        case id, name, slug, image
//        case yearEnd = "year_end"
//        case yearStart = "year_start"
//        case gamesCount = "games_count"
//        case imageBackground = "image_background"
//    }
//}
//
//// MARK: - Requirements
//struct Requirements: Codable {
//    let minimum, recommended: String?
//}
//
//// MARK: - Rating
//struct Rating: Codable {
//    let id: Int
//    let title: String
//    let count: Int
//    let percent: Double
//}
//
//// MARK: - Store
//struct Store: Codable {
//    let id: Int
//    let url: String
//    let store: Developer
//}
//
//// MARK: - Encode/decode helpers
//
//class JSONNull: Codable, Hashable {
//
//    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
//        return true
//    }
//
//    public var hashValue: Int {
//        return 0
//    }
//
//    public init() {}
//
//    public required init(from decoder: Decoder) throws {
//        let container = try decoder.singleValueContainer()
//        if !container.decodeNil() {
//            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
//        }
//    }
//
//    public func encode(to encoder: Encoder) throws {
//        var container = encoder.singleValueContainer()
//        try container.encodeNil()
//    }
//}

