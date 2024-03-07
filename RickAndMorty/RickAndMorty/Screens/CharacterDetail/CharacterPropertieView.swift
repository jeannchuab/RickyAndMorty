//
//  CharacterPropertieView.swift
//  RickAndMorty
//
//  Created by Jeann Luiz on 07/03/24.
//

import SwiftUI

struct CharacterPropertieView: View {
    var title: String
    var value: String
    
    var body: some View {
        VStack {
            Text(title)
                .bold()
                .font(.caption)
//                .italic() //iOS 16 or newer
            
            Text(value)
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    CharacterPropertieView(title: "Carbs", value: "\(MockData.character1.gender)")
}
