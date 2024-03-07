//
//  CharacterDetailView.swift
//  RickAndMorty
//
//  Created by Jeann Luiz on 07/03/24.
//

import SwiftUI

struct CharacterDetailView: View {
    @EnvironmentObject var characterViewModel: CharacterViewModel
    
    let character: CharacterModel
    @Binding var isShowingDetail: Bool
    
    var body: some View {
        VStack {
            CustomRemoteImage(urlString: character.image)
                .scaledToFill()
                   
            ZStack {
                BackgroundView()
                
                VStack{
                    Text(character.name)
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding(.bottom)
                    
                    HStack(spacing: 40) {
                        CharacterPropertieView(title: "Status", value: "\(character.status)") //TODO: Add emoji dead/alive
                        CharacterPropertieView(title: "Gender", value: "\(character.gender)")
                        CharacterPropertieView(title: "Specie", value: "\(character.species)")
                    }
                    
                    Button {
                        withAnimation(.easeInOut) {
                            isShowingDetail = false
                        }
                    } label: {
                        Image(systemName: "star")
                            .tint(Color.accentColor)
                        Text("Add as favorite")
                            .tint(Color.accentColor)
                    }
                    .padding([.top, .bottom])
                }
                .padding([.top, .bottom])
            }
        }
        .frame(width: 300, height: 525)
        .background(Color(.systemBackground))
        .cornerRadius(12)        
        .overlay {
            RoundedRectangle(cornerRadius: 16)
                .stroke(.accent, lineWidth: 4)
        }
        .shadow(radius: 40)
        .overlay(
            Button {
                withAnimation(.easeInOut) {
                    isShowingDetail = false
                }
            } label: {
                XDismissButton()
            }
            .padding()
        ,alignment: .topTrailing)
    }
}

#Preview {
    CharacterDetailView(character: MockData.character1, isShowingDetail: .constant(false))
}
