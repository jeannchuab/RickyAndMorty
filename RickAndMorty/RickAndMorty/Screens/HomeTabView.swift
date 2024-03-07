//
//  TabView.swift
//  RickAndMorty
//
//  Created by Jeann Luiz on 07/03/24.
//

import SwiftUI

struct HomeTabView: View {
    @StateObject var characterViewModel = CharacterViewModel()
    @StateObject var favoritesViewModel = FavoriteViewModel()
    
    var body: some View {
        ZStack {
            TabView {
                CharacterListView()
                    .tabItem {
                        Label("Home", systemImage: "globe.europe.africa")
                            .tint(.accentColor)
                    }
                
                FavoritesListView()
                    .tabItem {
                        Label("Favorites", systemImage: "star")
                            .tint(.accentColor)
                    }
            }
        }
        .environmentObject(characterViewModel)
        .environmentObject(favoritesViewModel)
    }
}

#Preview {
    HomeTabView()
}
