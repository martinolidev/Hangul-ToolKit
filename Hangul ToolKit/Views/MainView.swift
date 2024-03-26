//
//  MainView.swift
//  Hangul ToolKit
//
//  Created by Martin Martinez on 25/03/24.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        VStack {
            GroupBox {
                VStack {
                    HStack {
                        Image(systemName: "arrow.uturn.down.square")
                        Text("안녕하세요")
                        Image(systemName: "arrow.uturn.left.square")
                    }
                    .font(.title)
                    
                    HStack {
                        Text("annyeonghaseyo")
                    }
                    .font(.title)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
