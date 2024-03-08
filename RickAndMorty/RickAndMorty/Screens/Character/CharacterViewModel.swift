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
    @Published private(set) var characterList: [CharacterModel] = []
    @Published private(set) var isLoading: Bool = false
    @Published var alertItem: AlertItem?
    @Published var isShowingDetail: Bool = false
    @Published var selectedCharacter: CharacterModel = MockData.character1
    
    let columns: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible())]
    
    var currentPage = 1
    
    func shouldLoadMoreData(character: CharacterModel) {
        if character.id == characterList.last?.id {
            currentPage += 1
            getCharacter()
        }
    }
        
    private func get(endpoint: Endpoint) {
        isLoading = true
        
        Task {
            do {
                switch endpoint {
                    
                case .characterAll:
                    let result = try await NetworkManager.getCharacter(page: currentPage)
                                        
                    if currentPage == 0 {
                        characterList = []
                        characterList = result
                    } else {
                        characterList.append(contentsOf: result)
                    }
                                                  
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
    
    func getCharacter() {        
        get(endpoint: .characterAll)
    }
}
