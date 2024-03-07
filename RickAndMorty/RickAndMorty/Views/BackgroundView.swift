//
//  BackgroundView.swift
//  RickAndMorty
//
//  Created by Jeann Luiz on 07/03/24.
//

import Foundation
import SwiftUI

struct BackgroundView: View {
    
    @State private var animatedGradient: Bool = false
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [Color.backgroundTop,
                                                   Color.backgroundMiddle,
                                                   Color.backgroundBottom]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .ignoresSafeArea(.all)
        .hueRotation(.degrees(animatedGradient ? 45 : 0))
        .onAppear {
            withAnimation(.easeInOut(duration: 2).repeatForever(autoreverses: true) ) {
                    animatedGradient.toggle()
                }
        }
    }
}

#Preview {
    BackgroundView()
}
