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
                                .onTapGesture {
                                    withAnimation(.easeInOut) {
                                        viewModel.isShowingDetail = true
                                        viewModel.selectedCharacter = character
                                    }
                                }
                        }
                    }
//                    .searchable(text: $viewModel.searchText, prompt: "Type your search here")
//                    .onSubmit(of: .search) {
//                        runSearch()
//                    }
                }
                .disabled(viewModel.isShowingDetail)
                .blur(radius: viewModel.isShowingDetail ? 20 : 0)
                .padding()
                
                if viewModel.isLoading {
                    LoadingView()
                }
                
                if let selectedCharacter = viewModel.selectedCharacter, viewModel.isShowingDetail {
                    CharacterDetailView(character: selectedCharacter,
                                        isShowingDetail: $viewModel.isShowingDetail)
                }
            }
            .onAppear() {
                if viewModel.characterList.isEmpty {
                    runSearch()
                }
            }
            .navigationTitle("🌀 Rick & Morty")
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
