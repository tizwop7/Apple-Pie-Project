//
//  ViewController.swift
//  Apple Pie Project
//
//  Created by Tisgar A. Haroun on 3/28/25.
//

import UIKit

var listOfWords = ["avacado", "swift", "oakland","raiders", "athletics", "roots", "panthers", "apples", "mango", "africa", "sudan", "palestine", "angels", "beyonce", "music", "dogs", "cats", "bed", "pasta", "catfish", "chicken", "tacos", "ramen", "abundance", "fortune", "prosperity", "love", "community", "village"]

let incorrectMovesAllowed = 7
var totalWins = 0
var totalLosses = 0

class ViewController: UIViewController {
    
    //
    @IBOutlet var treeImageView: UIImageView!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var correctWordLabel: UILabel!
    
    @IBOutlet var letterButtons: UIButton!
    @IBAction func letterButtonPressed(_ sender: UIButton) {
        sender.isEnabled = false
        let letterString = sender.configuration!.title!
        let letter = Character(letterString.lowercased())
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
    }
    var currentGame: Game!
    
    func newRound() {
        let newWord = listOfWords.removeFirst()
        currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed, guessedLetters: [])
        updateUI()
    }
    
    func updateUI() {
        scoreLabel.text = "Wins: \(totalWins), Losses: \(totalLosses)"
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
    }
}
