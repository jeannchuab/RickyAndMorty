//
//  CharacterDetailView.swift
//  RickAndMorty
//
//  Created by Jeann Luiz on 07/03/24.
//

import SwiftUI

struct CharacterDetailView: View {
    @EnvironmentObject var characterViewModel: CharacterViewModel
    @EnvironmentObject var favoriteViewModel: FavoriteViewModel
    
    var body: some View {
        VStack {
            CustomRemoteImage(urlString: characterViewModel.selectedCharacter.image)
                .scaledToFill()
                   
            ZStack {
                BackgroundView()
                
                VStack{
                    Text(characterViewModel.selectedCharacter.name)
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding([.leading, .trailing])
                    
                    Divider()
                        .tint(.accentColor)
                    
                    Text("\("📍") \(characterViewModel.selectedCharacter.location.name)")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .padding(.bottom)
                        .padding(.top, 6)
                    
                    HStack(spacing: 40) {
                        CharacterPropertieView(title: "Status", value: "\(characterViewModel.selectedCharacter.statusFormatted)")                         
                        CharacterPropertieView(title: "Gender", value: "\(characterViewModel.selectedCharacter.gender)")
                        CharacterPropertieView(title: "Specie", value: "\(characterViewModel.selectedCharacter.species)")
                    }
                    
                    Divider()
                        .tint(.accentColor)
                    
                    Button {
                        favoriteViewModel.isFavoriteToggle(characterViewModel.selectedCharacter)
                    } label: {
                        Image(systemName: favoriteViewModel.isFavorite(characterViewModel.selectedCharacter) ? "star.fill" : "star")
                            .tint(Color.accentColor)
                        Text(favoriteViewModel.isFavorite(characterViewModel.selectedCharacter) ? "Remove favorite" : "Add as favorite")
                            .tint(Color.accentColor)
                    }
                    .buttonStyle(.bordered)
                    .tint(Color.accentColor)
                    .controlSize(.large)
                    .padding(.top, 16)
                }
                .padding([.top, .bottom])
            }
        }
        .frame(width: 300, height: 550)
        .cornerRadius(12)        
        .overlay {
            RoundedRectangle(cornerRadius: 16)
                .stroke(.accent, lineWidth: 4)
        }
        .shadow(radius: 40)
        .overlay(
            Button {
                withAnimation(.easeInOut) {
                    characterViewModel.isShowingDetail = false
                }
            } label: {
                XDismissButton()
            }
            .padding()
        ,alignment: .topTrailing)
    }
}

#Preview {
    CharacterDetailView()
}
