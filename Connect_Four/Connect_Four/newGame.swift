//
//  newGame.swift
//  Connect_Four
//
//  Created by Inna on 24.09.2024.
//

import Foundation

enum GameResult{
    case gameOver
    case playerWon(_ player: Player)
    case drawGame
}

func newGame(_ board: (rows: Int, columns: Int), _ player: (first: Player, second: Player)) throws -> GameResult {
    // инициализируем новую игру
    var game = Game(board.rows, board.columns)
    game.printBoard()
    
    var currentPlayer: Player = player.first

    repeat {
        // делаем ход
        var gameTurn: (turnSuccess: Bool, gameOver: Bool) = (false, false)
        
        repeat {
            do {
                gameTurn = try game.gameTurn(currentPlayer)
            } catch GameError.incorrectColumnNumber {
                print("Incorrect column number")
            } catch GameError.outOfRange {
                print("The column number is out of range (1 - \(board.columns))")
            } catch GameError.noReadLine {
                print("Can't read line")
            } catch GameError.columnFull(let colNumber){
                print("Column \(colNumber) is full. Try again.")
            }
        } while !gameTurn.turnSuccess
        
        // игрок захотел выйти
        if gameTurn.gameOver {
            return GameResult.gameOver
        }
        
        game.printBoard()
        
        // проверяем на выигрыш
        if game.isWin(currentPlayer) {
            print("Player \(currentPlayer.name) won")
            return GameResult.playerWon(currentPlayer)
        }
        // проверяем на ничью
        if !game.board.map {$0.contains(" ")} .contains(true) {
            print("It's a draw")
            return GameResult.drawGame
        }
        // меняем игрока для следующего хода
        currentPlayer = currentPlayer.name == player.first.name ? player.second : player.first
    } while true
}
