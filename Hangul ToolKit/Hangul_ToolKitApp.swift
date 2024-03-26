//
//  Hangul_ToolKitApp.swift
//  Hangul ToolKit
//
//  Created by Martin Martinez on 25/03/24.
//

import SwiftUI
import SwiftData

@main
struct Hangul_ToolKitApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }.modelContainer(for: FavoriteWords.self)
    }
}
