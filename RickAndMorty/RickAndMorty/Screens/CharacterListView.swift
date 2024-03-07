//
//  ContentView.swift
//  RickAndMorty
//
//  Created by Jeann Luiz on 07/03/24.
//

import SwiftUI

struct CharacterListView: View {
    @StateObject var viewModel = CharacterViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundView()
                
                ScrollView {
                    LazyVGrid(columns: viewModel.columns) {
                        ForEach(viewModel.characterList) { character in
                            CharacterCell(characterModel: character)
                                  //Pagination
//                                .onAppear {
//                                    viewModel.shouldLoadMoreData(tvShow: tvShowModel)
//                                }
                        }
                    }
//                    .searchable(text: $viewModel.searchText, prompt: "Type your search here")
//                    .onSubmit(of: .search) {
//                        runSearch()
//                    }
                    .navigationTitle("🌀 Rick & Morty")
                }
                .padding()
                
                if viewModel.isLoading {
                    LoadingView()
                }
            }
            .onAppear() {
                if viewModel.characterList.isEmpty {
                    runSearch()
                }
            }
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
        .environmentObject(viewModel)
    }
    
    func runSearch() {
        Task {
            viewModel.getCharacter(searchQuery: "")
        }
    }
}

#Preview {
    CharacterListView()
}
