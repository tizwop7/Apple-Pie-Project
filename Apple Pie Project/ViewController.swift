//
//  ViewController.swift
//  Apple Pie Project
//
//  Created by Tisgar A. Haroun on 3/28/25.
//

import UIKit


class ViewController: UIViewController {
    
    var listOfWords = ["avacado", "swift", "oakland","raiders", "athletics", "roots", "panthers", "apples", "mango", "africa", "sudan", "palestine", "angels", "beyonce", "music", "dogs", "cats", "bed", "pasta", "catfish", "chicken", "tacos", "ramen", "abundance", "fortune", "prosperity", "love", "community", "village"]
    
    let incorrectMovesAllowed = 7
    var totalWins = 0 {
        didSet {
            newRound()
        }
    }
    var totalLosses = 0 {
        didSet {
            newRound()
        }
    }
    
    //
    @IBOutlet var treeImageView: UIImageView!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var correctWordLabel: UILabel!
    
    @IBOutlet var letterButtons: [UIButton]!
    @IBAction func letterButtonPressed(_ sender: UIButton) {
        sender.isEnabled = false // may or may not have to remove underscore
        
        let letterString = sender.configuration!.title!
        let letter =  Character(letterString.lowercased())
        currentGame.playerGuessed(letter: letter)
        updateGameState()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
    }
    var currentGame: Game! // update initilization for current game
    
    
    
    func newRound() {
        if !listOfWords.isEmpty {
            let newWord = listOfWords.removeFirst()
            currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed, guessedLetters: [])
            enableLetterButtons(true)
            updateUI()
        } else {
            enableLetterButtons(false)
        }
    }
    
    func enableLetterButtons(_ enable:Bool) {
        for button in letterButtons {
            button.isEnabled = enable
        }
    }
    
    
    func updateGameState() {
        if currentGame.incorrectMovesRemaining == 0 {
            totalLosses += 1
        } else if currentGame.word == currentGame.formattedWord {
            totalWins += 1
        } else {
            updateUI()
        }
    }
    
    func updateUI() {
        var letters = [String()]
        for letter in currentGame.formattedWord {
            letters.append(String(letter))
        }
        let wordWithSpacing = letters.joined(separator: " ")
        correctWordLabel.text = wordWithSpacing
        scoreLabel.text = "Wins: \(totalWins), Losses: \(totalLosses)"
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
    }
}
