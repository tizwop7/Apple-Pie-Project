//
//  Game.swift
//  Apple Pie Project
//
//  Created by Tisgar A. Haroun on 3/28/25.
//

import Foundation

struct Game {
    var word: String
    var incorrectMovesRemaining: Int
    var guessedLetters: [Character]
    
    mutating func playerGuessed(letter: Character) {
        guessedLetters.append(letter)
        if !word.contains(letter) {
            incorrectMovesRemaining -= 1
        }

    }
}


