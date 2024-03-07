//
//  CharacterCell.swift
//  RickAndMorty
//
//  Created by Jeann Luiz on 07/03/24.
//

import SwiftUI

struct CharacterCell: View {
    var characterModel: CharacterModel
    @EnvironmentObject var characterViewModel: CharacterViewModel
    
    var body: some View {
            VStack {
                Spacer()
                
                ZStack {
                    CustomRemoteImage(urlString: characterModel.image)
                        .scaledToFit()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(16)
                        .overlay {
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(.accent, lineWidth: 4)
                        }
                }
                                                                
                Text(characterModel.name)
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(Color(.label))
                    .multilineTextAlignment(.center)
                    .frame(height: 50)
                    .minimumScaleFactor(0.7)
                    .padding([.trailing, .leading])
                    .padding(.top, 4)
                
                Spacer()
            }
            .onTapGesture {
                withAnimation(.easeInOut) {
                    characterViewModel.isShowingDetail = true
                    characterViewModel.selectedCharacter = characterModel
                }
            }
            .padding(.bottom)
            .padding(.trailing, 4)
            .padding(.leading, 4)
        }
}

#Preview {
    CharacterCell(characterModel: MockData.character1)
}
