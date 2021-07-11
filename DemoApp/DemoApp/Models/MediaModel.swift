//
//  MediaModel.swift
//  DemoApp
//
//  Created by Ateeq on 7/11/21.
//

import Foundation

struct MediaModel: Codable {
    
    let id, airDate: String?
    let episodes: [Episode]?
    let name, overview: String?
    let categoryResponseID: Int?
    let posterPath: String?
    let seasonNumber: Int?

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case airDate = "air_date"
        case episodes, name, overview
        case categoryResponseID = "id"
        case posterPath = "poster_path"
        case seasonNumber = "season_number"
    }
}

// MARK: - Episode
struct Episode: Codable {
    
    let airDate: String?
    let episodeNumber: Int?
    let crew, guestStars: [Crew]?
    let id: Int?
    let name, overview, productionCode: String?
    let seasonNumber: Int?
    let stillPath: String?
    let voteAverage: Double?
    let voteCount: Int?

    enum CodingKeys: String, CodingKey {
        case airDate = "air_date"
        case episodeNumber = "episode_number"
        case crew
        case guestStars = "guest_stars"
        case id, name, overview
        case productionCode = "production_code"
        case seasonNumber = "season_number"
        case stillPath = "still_path"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

// MARK: - Crew
struct Crew: Codable {
    let job: String?
    let department: String?
    let creditID: String?
    let adult: Bool?
    let gender, id: Int?
    let knownForDepartment: String?
    let name, originalName: String?
    let popularity: Double?
    let profilePath: String?
    let character: String?
    let order: Int?

    enum CodingKeys: String, CodingKey {
        case job, department
        case creditID = "credit_id"
        case adult, gender, id
        case knownForDepartment = "known_for_department"
        case name
        case originalName = "original_name"
        case popularity
        case profilePath = "profile_path"
        case character, order
    }
}
