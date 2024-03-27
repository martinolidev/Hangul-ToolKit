//
//  SpeechView.swift
//  Hangul ToolKit
//
//  Created by Martin Martinez on 27/03/24.
//

import SwiftUI
import Speech
import AVFoundation

struct SpeechView: View {
    @State private var recognizedText = "Tap to start recording"
    private let speechRecognizer = SFSpeechRecognizer(locale: Locale(identifier: "ko-KR"))!
    private let audioEngine = AVAudioEngine()
    
    var body: some View {
        VStack {
            Text(recognizedText)
                .padding()
            Button(action: {
                if audioEngine.isRunning {
                    audioEngine.stop()
                    recognizedText = "Tap to start recording"
                } else {
                    do {
                        try startRecording()
                        recognizedText = "Listening..."
                    } catch {
                        recognizedText = "Recording failed: \(error)"
                    }
                }
            }) {
                Text(audioEngine.isRunning ? "Stop recording" : "Start recording")
            }
        }
    }
    
    private func startRecording() throws {
        let audioSession = AVAudioSession.sharedInstance()
        try audioSession.setCategory(.record, mode: .measurement, options: .duckOthers)
        try audioSession.setActive(true, options: .notifyOthersOnDeactivation)

        let inputNode = audioEngine.inputNode
        let recordingFormat = inputNode.outputFormat(forBus: 0)
        inputNode.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { buffer, _ in
            let request = SFSpeechAudioBufferRecognitionRequest()
            request.append(buffer)
            
            let recognitionTask = speechRecognizer.recognitionTask(with: request) { result, error in
                if let result = result {
                    DispatchQueue.main.async {
                        self.recognizedText = result.bestTranscription.formattedString
                    }
                } else if let error = error {
                    print("Recognition failed: \(error)")
                }
            }
        }
        
        audioEngine.prepare()
        try audioEngine.start()
    }
}

#Preview {
    SpeechView()
}
