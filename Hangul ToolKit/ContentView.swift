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
                        Image(systemName: "slider.horizontal.3")
                    }
                    
                    ToolbarItem {
                        Image(systemName: "star.fill")
                    }
                }
        }
    }
}

#Preview {
    ContentView()
}
