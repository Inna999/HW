//
//  main.swift
//  Connect_Four
//
//  Created by Inna on 19.09.2024.
//

import Foundation

print("Connect four")

//ввод параметров игры
let player = setPlayersNames()
let board = setBoardDimension()

print("\(player.first.name) VS \(player.second.name)")
print("\(board.rows) X \(board.columns) board")

// определяем количество игр
let gameCount = multipleGame()

// одиночная игра
if gameCount < 2 {
    print("Single game")
    try newGame(board, player)

// мульти игра
} else {
    // кортеж для хранения результатов игр
    var gameScore: (scoreFirstPlayer: Int, scoreSecondPlayer: Int) = (0,0)
    
    print("Total \(gameCount) games")
    // флаг окончания игры
    var gameOver: Bool = false
    
    for game in 1...gameCount {
        print("Game #\(game)")
        switch try newGame(board, game % 2 != 0 ? player : (player.second, player.first)) {
        case GameResult.drawGame:
            gameScore.scoreFirstPlayer += 1
            gameScore.scoreSecondPlayer += 1
        case GameResult.playerWon(let playerWon):
            if playerWon.name == player.first.name {
                gameScore.scoreFirstPlayer += 2
            } else {
                gameScore.scoreSecondPlayer += 2
            }
        case GameResult.gameOver:
            gameOver = true
        }
        if gameOver {
            break
        }
        print("\(player.first.name): \(gameScore.scoreFirstPlayer) \(player.second.name): \(gameScore.scoreSecondPlayer)")
        
    }
}


print("Game over!")
