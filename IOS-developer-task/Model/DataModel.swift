//
//  DataModel.swift
//  IOS-developer-task
//
//  Created by Elsaadany on 24/12/2021.
//

import Foundation

// MARK: - PostDetail
struct PostDetail: Codable {
    var score: Double?
    var show: Show?
}

// MARK: - Show
struct Show: Codable {
    var id: Int?
    var url: String?
    var name: String?
    var type: TypeEnum?
    var language: Language?
    var genres: [String]?
    var status: Status?
    var runtime: Int?
    var averageRuntime: Int?
    var premiered, ended: String?
    var officialSite: String?
    var schedule: Schedule?
    var rating: Rating?
    var weight: Int?
    var network, webChannel: Network?
    var dvdCountry: String?
    var externals: Externals?
    var image: Image?
    var summary: String?
    var updated: Int?
    var links: Links?

    enum CodingKeys: String, CodingKey {
        case id, url, name, type, language, genres, status, runtime, averageRuntime, premiered, ended, officialSite, schedule, rating, weight, network, webChannel, dvdCountry, externals, image, summary, updated
        case links = "_links"
    }
}

// MARK: - Externals
struct Externals: Codable {
    var tvrage, thetvdb: Int?
    var imdb: String?
}

// MARK: - Image
struct Image: Codable {
    var medium, original: String?
}

enum Language: String, Codable {
    case english = "English"
    case japanese = "Japanese"
}

// MARK: - Links
struct Links: Codable {
    var linksSelf, previousepisode: Previousepisode?

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
        case previousepisode
    }
}

// MARK: - Previousepisode
struct Previousepisode: Codable {
    var href: String?
}

// MARK: - Network
struct Network: Codable {
    var id: Int?
    var name: String?
    var country: Country?
}

// MARK: - Country
struct Country: Codable {
    var name, code, timezone: String?
}

// MARK: - Rating
struct Rating: Codable {
    var average: Int?
}

// MARK: - Schedule
struct Schedule: Codable {
    var time: String?
    var days: [String]?
}

enum Status: String, Codable {
    case ended = "Ended"
}

enum TypeEnum: String, Codable {
    case animation = "Animation"
    case documentary = "Documentary"
    case scripted = "Scripted"
}

typealias PostDetails = [PostDetail]
