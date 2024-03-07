//
//  FavoriteViewModel.swift
//  RickAndMorty
//
//  Created by Jeann Luiz on 07/03/24.
//

import SwiftUI

class FavoriteViewModel: ObservableObject {
    @AppStorage("favorites") private var favoritesData: Data?
    
    @Published private(set) var favoritesCharacteres: [CharacterModel] = []
    @Published private(set) var isLoading: Bool = false
    @Published var alertItem: AlertItem?
    
    let columns: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible())]
    
    init() {
        self.getFavorites()
    }
    
    func add(_ item: CharacterModel) {
        self.favoritesCharacteres.append(item)
        do {
            favoritesData = try JSONEncoder().encode(favoritesCharacteres)
        } catch {
            alertItem = AlertItem(error: .invalidFavorite)
        }
    }
        
    func remove(_ item: CharacterModel) {
        self.favoritesCharacteres.removeAll(where: { $0.id == item.id })
        do {
            favoritesData = try JSONEncoder().encode(favoritesCharacteres)
        } catch {
            alertItem = AlertItem(error: .invalidFavorite)
        }
    }
    
    func isFavorite(_ item: CharacterModel) -> Bool {
        let result = self.favoritesCharacteres.filter({ $0.id == item.id })
        return !result.isEmpty
    }
    
    func isFavoriteToggle(_ item: CharacterModel) {
        if isFavorite(item) {
            remove(item)
        } else {
            add(item)
        }
    }
    
    func getFavorites() {
        do {
            guard let favoritesData else { return }
            
            let result = try JSONDecoder().decode([CharacterModel].self, from: favoritesData)
            favoritesCharacteres = result.sorted(by: { $0.name < $1.name })
        } catch {
            alertItem = AlertItem(error: .invalidFavorite)
        }
    }
                               
}
