//
//  FavoriteWords.swift
//  Hangul ToolKit
//
//  Created by Martin Martinez on 25/03/24.
//

import Foundation
import SwiftData


@Model
class FavoriteWords {
    
    init(date: Date, koreanWord: String, latinWord: String) {
        self.date = Self.dateWithoutTime(from: date)
        self.koreanWord = koreanWord
        self.latinWord = latinWord
    }
    
    var date: String
    var koreanWord: String
    var latinWord: String
    
    static func dateWithoutTime(from date: Date) -> String {
            let formatter = DateFormatter()
            formatter.dateStyle = .medium
            formatter.timeStyle = .none
            return formatter.string(from: date)
    }
}
