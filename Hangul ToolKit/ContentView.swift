//
//  ContentView.swift
//  Hangul ToolKit
//
//  Created by Martin Martinez on 25/03/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            MainView()
                .navigationTitle("Hangul ToolKit")
                .toolbar {
                    
                    ToolbarItem {
                        NavigationLink(destination: FavoriteWordsView()) {
                            Image(systemName: "star.fill")
                                .foregroundStyle(.indigo)
                        }
                    }
                }
        }
    }
}

#Preview {
    ContentView()
}
