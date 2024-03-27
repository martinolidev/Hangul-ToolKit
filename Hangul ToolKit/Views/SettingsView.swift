//
//  SettingsView.swift
//  Hangul ToolKit
//
//  Created by Martin Martinez on 27/03/24.
//

import SwiftUI

class SpeechSettings: ObservableObject {
    @Published var speechRate: Double = 0.5
}


struct SettingsView: View {
    @ObservedObject var speech: SpeechSettings
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Speech Rate")
                .font(.headline)
            Slider(value: $speech.speechRate, in: 0...1, step: 0.1)
                .padding()
                .accentColor(.indigo)
            HStack {
                Text("Current rate: ")
                Text(String(format: "%.1f", speech.speechRate))
            }
            Spacer()
        }
        .padding()
        .navigationTitle("Settings")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ContentView()
}
