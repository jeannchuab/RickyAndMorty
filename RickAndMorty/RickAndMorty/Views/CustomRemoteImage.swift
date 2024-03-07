//
//  RemoteImage.swift
//  RickAndMorty
//
//  Created by Jeann Luiz on 07/03/24.
//

import SwiftUI

@MainActor
final class ImageLoader: ObservableObject {
    @Published var image: Image? = nil
    
    func load(fromURLString urlString: String) {
                                
        Task {
            let uiImage = try await NetworkManager.shared.downloadImageAsync(fromURLString: urlString)
            self.image = Image(uiImage: uiImage)
        }
    }
}

struct CustomRemoteImage: View {
    @StateObject var imageLoader = ImageLoader()
    
    var urlString: String = ""
    var body: some View {
        
        if urlString.isEmpty {
            Image(systemName: "person.fill.questionmark")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 80, height: 238)
        } else {
            ZStack {
                LoadingView()
                imageLoader.image?.resizable()
            }
            .onAppear {
                imageLoader.load(fromURLString: urlString)
            }
        }
    }
}


