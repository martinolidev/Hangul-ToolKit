//
//  FavoriteWordsView.swift
//  Hangul ToolKit
//
//  Created by Martin Martinez on 25/03/24.
//

import SwiftUI
import SwiftData

struct FavoriteWordsView: View {
    @Environment(\.modelContext) private var context
    @Query private var words: [FavoriteWords]
    
    var body: some View {
        VStack {
            List {
                ForEach(words) { word in
                    HStack {
                        Text(word.koreanWord)
                        Text(word.latinWord)
                        Text("\(word.date)")
                    }
                }
            }
        }.navigationTitle("Favorite Words")
    }
}

#Preview {
    ContentView()
}
