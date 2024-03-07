//
//  BackgroundView.swift
//  RickAndMorty
//
//  Created by Jeann Luiz on 07/03/24.
//

import Foundation
import SwiftUI

struct BackgroundView: View {
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [Color.backgroundTop,
                                                   Color.backgroundMiddle,
                                                   Color.backgroundBottom]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .ignoresSafeArea(.all)
    }
}

#Preview {
    BackgroundView()
}
