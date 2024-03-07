//
//  FavoriteEmptyListView.swift
//  RickAndMorty
//
//  Created by Jeann Luiz on 07/03/24.
//

import SwiftUI

struct FavoriteEmptyListView: View {
    
    let message: String = "It looks like you don't have any favorite yet. \n\nPick your favorites before they vanish from this universe!"
    
    var body: some View {
        ZStack {
            BackgroundView()
            
            VStack {
                Text("🥲")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                
                Text(message)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .padding()
                
                Text("🛸")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                
            }
            .offset(y: -50)
        }
    }
}

#Preview {
    FavoriteEmptyListView()
}
