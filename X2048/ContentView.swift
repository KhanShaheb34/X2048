//
//  ContentView.swift
//  X2048
//
//  Created by Shakirul Hasan Khan on 9/28/24.
//

import SwiftUI

struct ContentView: View {
    @State private var showGame = false
    
    var body: some View {
        if showGame {
            GameView()
        } else {
            SplashScreen()
                .onAppear() {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        withAnimation {
                            self.showGame = true
                        }
                    }
            }
        }
    }
}

#Preview {
    ContentView()
}
