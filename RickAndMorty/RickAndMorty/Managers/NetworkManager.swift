//
//  NetworkManager.swift
//  RickAndMorty
//
//  Created by Jeann Luiz on 07/03/24.
//

import Foundation
import UIKit

enum Paths: String {
    case character
}

enum Endpoint: Equatable {
    case characterAll
    case characterById(_ idTVShow: String)
//    case characterBySearch
    
    var path: String {
        switch self {
        
        case .characterAll:
            return Paths.character.rawValue
            
        case .characterById(let id):
            return Paths.character.rawValue + "/" + String(id)
            
//        case .characterBySearch:
//            return Paths.character.rawValue
        }
    }
}

final class NetworkManager {
    static let shared = NetworkManager()
    private let cache = NSCache<NSString, UIImage>()
    
    static let baseUrl = "https://rickandmortyapi.com/api/"
    
    private init() {

    }
        
    static func buildUrl(path: String) -> String {
        return baseUrl + path
    }
    
    //MARK: Image
    func downloadImageAsync(fromURLString urlString: String) async throws -> UIImage {
        
        let cacheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: cacheKey) {
            return image
        }
        
        guard let url = URL(string: urlString) else {
            throw CustomError.invalidUrl
        }
        
        let (data, response) = try await URLSession.shared.data(for: URLRequest(url: url))
        
        guard let response = response as? HTTPURLResponse,
                response.statusCode == 200,
                let image = UIImage(data: data)
        else {
            throw CustomError.invalidResponse
        }
        
        self.cache.setObject(image, forKey: cacheKey)
        
        return image
    }
    
    static func getCharacter() async throws -> [CharacterModel] {
        var components = URLComponents(string: buildUrl(path: Endpoint.characterAll.path))
//        components?.queryItems = []
//        
//        if page > 0 {
//            components?.queryItems?.append(contentsOf: [URLQueryItem(name: "page", value: String(page))])
//        }
        
        guard let url = components?.url else {
            throw CustomError.invalidUrl
        }
    
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw CustomError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            let decodedResponse = try decoder.decode(CharacterInfoModel.self, from: data)
            return decodedResponse.results.sorted(by: { $0.name < $1.name })
        } catch let error {
            print(error)
            throw CustomError.invalidData
        }
    }
}
