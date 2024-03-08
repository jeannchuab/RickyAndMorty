//
//  ContentView.swift
//  RickAndMorty
//
//  Created by Jeann Luiz on 07/03/24.
//

import SwiftUI

struct CharacterListView: View {
    @EnvironmentObject var characterViewModel: CharacterViewModel
    
    var body: some View {
        
        NavigationView {
            ZStack {
                BackgroundView()
                
                ScrollView {
                    LazyVGrid(columns: characterViewModel.columns) {
                        ForEach(characterViewModel.characterList) { character in
                            CharacterCell(characterModel: character)
                                .onAppear {
                                    characterViewModel.shouldLoadMoreData(character: character)
                                }
                        }
                    }
                }
                .disabled(characterViewModel.isShowingDetail)
                .blur(radius: characterViewModel.isShowingDetail ? 20 : 0)
                .padding()
                
                if characterViewModel.isLoading {
                    LoadingView()
                }
                                
                if characterViewModel.isShowingDetail {
                    CharacterDetailView()
                }
            }
            .onAppear() {
                characterViewModel.getCharacter()
            }
            .navigationTitle("🌀 Rick & Morty")
            .navigationBarTitleDisplayMode(.automatic)
        }
        .alert(item: $characterViewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
        .environmentObject(characterViewModel)
    }
}

#Preview {
    CharacterListView()
}
