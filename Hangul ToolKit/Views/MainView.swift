//
//  MainView.swift
//  Hangul ToolKit
//
//  Created by Martin Martinez on 25/03/24.
//

import SwiftUI
import AVFoundation
import SwiftData

struct MainView: View {
    @State private var input: String = ""
    @State private var latin: String = ""
    @State private var speech: AVSpeechSynthesizer?
    @State private var showAlert: Bool = false
    @ObservedObject var speechSettings = SpeechSettings()
    
    @Environment(\.modelContext) private var context
    
    var body: some View {
        VStack {
            Image("Transformer")
                .resizable()
                .frame(width: 180, height: 180)
                .padding()
            
            HStack {
                Text("Hangul to Latin")
                    .font(.title2)
                    .bold()
                Spacer()
                Button("Add to your favorites") {
                    if input.isEmpty {
                        showAlert = true
                    } else {
                        addToFavorite(korean: input, latin: latin)
                    }
                }.foregroundStyle(.indigo)
            }.padding()
            
            HStack {
                TextField("Type a korean word", text: $input)
                    .padding(.top)
                    .frame(height: 30)
                
                Button(action: {
                    if input.isEmpty {
                        showAlert = true
                    } else {
                        latin = input.applyingTransform(.toLatin, reverse: false) ?? ""
                        textToSpeech(text: input)
                    }
                }) {
                    Image(systemName: "waveform.circle.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundStyle(.indigo)
                }
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Empty field"), message: Text("Type a korean word"), dismissButton: .default(Text("Ok")))
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
            Section {
                
            } footer: {
                Text("Make sure you installed the Korean keyboard")
                    .foregroundStyle(.gray)
                    .font(.caption)
            }
        }.toolbar {
            ToolbarItem {
                NavigationLink(destination: SettingsView(speech: speechSettings)) {
                    Image(systemName: "gearshape.fill")
                        .foregroundStyle(.indigo)
                }
            }
        }
    }
    
    func textToSpeech(text: String) {
        let utterance = AVSpeechUtterance(string: text)
        let voice = AVSpeechSynthesisVoice(language: "ko-KR")
        utterance.voice = voice
        utterance.rate = Float(speechSettings.speechRate)
        speech = AVSpeechSynthesizer()
        speech?.speak(utterance)
    }
    
    func addToFavorite(korean: String, latin: String) {
        //create data
        let data = FavoriteWords(date: Date(), koreanWord: korean, latinWord: latin)
        context.insert(data)
    }
}

#Preview {
    ContentView()
}
