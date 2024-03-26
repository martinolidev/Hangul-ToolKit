//
//  MainView.swift
//  Hangul ToolKit
//
//  Created by Martin Martinez on 25/03/24.
//

import SwiftUI

struct MainView: View {
    @State private var input: String = "Transform korean"
    @State private var latin: String = "to latin equivalent"
    
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
            }.padding(.horizontal)
        }
    }
}

#Preview {
    ContentView()
}
