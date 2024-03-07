//
//  CharacterInfoModel.swift
//  RickAndMorty
//
//  Created by Jeann Luiz on 07/03/24.
//

import Foundation

struct CharacterInfoModel: Codable {
    let info: InfoModel
    let results: [CharacterModel]
}

struct InfoModel: Codable {
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
}

struct CharacterModel: Codable, Identifiable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String?
    let gender: String
    let origin: OriginModel
    let location: LocationModel
    let image: String
    let episode: [String]
    let url: String
    let created: String
    
    var statusFormatted: String {
        return status.lowercased() == "dead" ? "\(status) 💀" : status
    }
}

struct OriginModel: Codable {
    let name: String
    let url: String?
}

struct LocationModel: Codable {
    let name: String
    let url: String
}
