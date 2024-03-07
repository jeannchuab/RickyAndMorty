//
//  CharacterViewModel.swift
//  RickAndMorty
//
//  Created by Jeann Luiz on 07/03/24.
//

import Foundation
import SwiftUI

@MainActor
class CharacterViewModel: ObservableObject {
    @Published var characterList: [CharacterModel] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading: Bool = false
    
    let columns: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible())]
        
    private func get(endpoint: Endpoint, searchQuery: String = "") {
        isLoading = true
        
        Task {
            do {
                switch endpoint {
                    
                case .characterAll:
                    let result = try await NetworkManager.getCharacter()
                    characterList = []
                    characterList = result
                    
                    
                    
//                case .tvShowBySearch:
//                    tvShowsModel = []
//                    tvShowsModel = try await NetworkManager.searchTVShow(searchQuery: searchQuery)
                    
                
                    
                default:
                    alertItem = AlertItem(error: .endpointNotFound)
                }
                
            } catch let error {
                if error is CustomError {
                    guard let customError = error as? CustomError else { return }
                    alertItem = AlertItem(error: customError)
                } else {
                    alertItem = AlertItem(error: .invalidData)
                }
            }
            isLoading = false
        }
    }
    
    func getCharacter(searchQuery: String = "") {
        if searchQuery.isEmpty {
            get(endpoint: .characterAll)
        } 
//        else {
//            get(endpoint: .characterAll, page: currentPage, searchQuery: searchQuery)
//        }
    }
}
