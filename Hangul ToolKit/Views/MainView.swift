//
//  MainView.swift
//  Hangul ToolKit
//
//  Created by Martin Martinez on 25/03/24.
//

import SwiftUI
import AVFoundation

struct MainView: View {
    @State private var input: String = ""
    @State private var latin: String = ""
    
    var body: some View {
        VStack {
            Image("Transformer")
                .resizable()
                .frame(width: 200, height: 200)
            
            HStack {
                Text("Hangul to Latin")
                    .font(.title2)
                    .bold()
                Spacer()
                Button("Add to your library") {
                    //code logic here
                }.foregroundStyle(.indigo)
            }.padding()
            
            HStack {
                TextField("Type a korean word", text: $input)
                    .padding(.top)
                    .frame(height: 30)
                
                Button(action: {
                    latin = input.applyingTransform(.toLatin, reverse: false) ?? ""
                }) {
                    Image(systemName: "arrow.up.circle.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                }
                
                Button(action: {
                    speakText(text: input)
                }) {
                    Image(systemName: "waveform.circle.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                }
            }.padding(.horizontal)
            
            HStack(spacing: 100) {
                VStack(spacing: 20) {
                    Text("Hangul")
                        .font(.title3)
                        .bold()
                    Text(input)
                        .bold()
                }
                
                VStack(spacing: 20) {
                    Text("Pronunciation")
                        .font(.title3)
                        .bold()
                    Text(latin)
                        .bold()
                }
            }
            .padding(.top)
            
            Spacer()
        }
    }
    
    func speakText(text: String) {
            let utterance = AVSpeechUtterance(string: text)
            utterance.voice = AVSpeechSynthesisVoice(language: "kr-KR")

            let synthesizer = AVSpeechSynthesizer()
            synthesizer.speak(utterance)
    }
}

#Preview {
    ContentView()
}
