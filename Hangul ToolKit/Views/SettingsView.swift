//
//  SettingsView.swift
//  Hangul ToolKit
//
//  Created by Martin Martinez on 27/03/24.
//

import SwiftUI

struct SettingsView: View {
    @State private var speechRate = 0.5
    
    var body: some View {
        VStack(alignment: .leading) {
            Section {
                Text("Speech Rate")
                    .font(.headline)
                Slider(value: $speechRate, in: 0...1, step: 0.1)
                    .padding()
                Text(String(format: "%.1f", speechRate))
            }
        }
        .padding()
        .navigationTitle("Settings")
    }
}

#Preview {
    ContentView()
}
