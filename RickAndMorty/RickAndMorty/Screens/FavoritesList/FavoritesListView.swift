//
//  FavoritesListView.swift
//  RickAndMorty
//
//  Created by Jeann Luiz on 07/03/24.
//

import SwiftUI

struct FavoritesListView: View {
    @EnvironmentObject var favoriteViewModel: FavoriteViewModel
    @EnvironmentObject var characterViewModel: CharacterViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundView()
                
                ScrollView {
                    LazyVGrid(columns: favoriteViewModel.columns) {
                                                                        
                        ForEach(favoriteViewModel.favoritesCharacteres) { character in
                            CharacterCell(characterModel: character)
                        }
                    }
                    .navigationTitle("⭐️ Favorites")
                }
                .disabled(characterViewModel.isShowingDetail)
                .blur(radius: characterViewModel.isShowingDetail ? 20 : 0)
                .padding()
                
                if favoriteViewModel.isLoading {
                    LoadingView()
                }
                
                if favoriteViewModel.favoritesCharacteres.isEmpty {
                    FavoriteEmptyListView()
                }
                
                if characterViewModel.isShowingDetail {
                    CharacterDetailView()
                }
            }
            .onAppear() {
                runSearch()
            }
        }
        .alert(item: $favoriteViewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
        .environmentObject(favoriteViewModel)
    }
    
    func runSearch() {
        Task {
            favoriteViewModel.getFavorites()
        }
    }
}

#Preview {
    FavoritesListView()
}

