//
//  LoadingView.swift
//  RickAndMorty
//
//  Created by Jeann Luiz on 07/03/24.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
            Color(.clear)
                .ignoresSafeArea(edges: .all)
                        
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .accentColor))
        }
    }
}


#Preview {
    LoadingView()
}
