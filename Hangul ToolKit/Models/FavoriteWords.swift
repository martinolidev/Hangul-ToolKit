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
        self.date = date
        self.koreanWord = koreanWord
        self.latinWord = latinWord
    }
    
    var date: Date
    var koreanWord: String
    var latinWord: String
}
