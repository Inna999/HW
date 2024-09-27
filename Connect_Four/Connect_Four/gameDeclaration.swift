//
//  game.swift
//  Connect_Four
//
//  Created by Inna on 20.09.2024.
//

import Foundation

/// перечисление ошибок
enum GameError: Error {
    case incorrectColumnNumber
    case outOfRange
    case noReadLine
    case columnFull(colNumber: Int)
}

/// определяем тип Игра
struct Game {
    /// массив для хранения ходов игроков
    var board: [[String]] = [[]]
    var rows: Int {
        board.count
    }
    var columns: Int {
        board[board.count - 1].count
    }
    
    /// инициализируем пустую доску
    init(_ rows: Int, _ columns: Int) {
        board = Array(
            repeating: Array(repeating: " ", count: columns),
            count: rows
        )
    }
    
    /// печать доски
    func printBoard() {
        let rowsPrint = rows + 1
        for i in 0...rowsPrint {
            for j in 0...columns {
                // выводим первую строчку с цифрами
                if i == 0, j < columns {
                    print(" \(j+1)", terminator: "")
                // выводим саму таблицу
                } else if i != rowsPrint, i != 0 {
                    print("║\(j != columns ? board[i-1][j] : "")", terminator: "")
                // выводим последнюю строчку каблицы0
                } else if i == rowsPrint {
                    if j == 0 {
                        print("╚═", terminator: "")
                    } else if j == columns {
                        print("╝", terminator: "")
                    } else {
                        print("╩═", terminator: "")
                    }
                }
            }
            print("")
        }
    }
    
    /// игрок делает ход
    mutating func gameTurn(_ player: Player) throws -> (turnSuccess: Bool, gameOver: Bool) {
        var turnSuccess: Bool = false // ход сделан
        
        // проверки на ошибки или выход из игры по "end"
        print("\(player.name)'s turn: ")
        guard let turn = readLine() else {
            throw GameError.noReadLine
        }
        if turn.lowercased() == "end" {
            return (true, true)
        }
        guard let turnColNumber = Int(turn) else {
            throw GameError.incorrectColumnNumber
        }
        if !(1...columns).contains(turnColNumber) {
            throw GameError.outOfRange
        }
        
        // ищем свободное место в колонке
        for i in 0..<rows {
            // место занято - переходим к следующей строчке
            if board[rows - 1 - i][turnColNumber - 1] != " " {
                continue
            }
            // место найдено
            board[rows - 1 - i][turnColNumber - 1] = player.char
            //Вопрос: нужно ли здесь добавить проверку на раскрытие опционала?
            // if let _ = board[rows - 1 - i]?[turnColNumber] {....
            turnSuccess = true
            break
        }
        if !turnSuccess {
            throw GameError.columnFull(colNumber: turnColNumber)
        }

        return (turnSuccess, false)
    }
    
    /// проверка выигрыша
    func isWin(_ player: Player) -> Bool {
        let searchChar: String = player.char == "*" ? "****" : "oooo"
      
        // проверка по строкам
        if board.map({$0.joined().contains(searchChar)}).contains(true) {
            return true
        }
        //проверка по столбцам
        for i in 0..<columns {
            if board.map({$0[i]}).joined().contains(searchChar) == true {
                return true
            }
        }
        //проверка по диагоналям
        for i in 0..<rows {
            var mainDiagonalUp: [String] = []
            var mainDiagonalDown: [String] = []
            var sideDiagonalUp: [String] = []
            var sideDiagonalDown: [String] = []
            // собираем диагонали
            for j in 0..<columns {
                //под гланой диагональю
                if (i + j) < rows, board[j + i][j] != " " {
                    mainDiagonalDown.append(board[j + i][j])
                }
                
                //над главной диагональю
                if (i + j) < columns, 
                   j < rows,
                   board[j][j + i] != " ",
                   i != 0 {
                        mainDiagonalUp.append(board[j][j + i])
                }
                
                //над побочной диагональю
                if (0..<rows).contains((rows - 1 - i) - j),
                   board[(rows - 1 - i) - j][j] != " " {
                        sideDiagonalUp.append(board[(rows - 1 - i) - j][j])
                }
                
                //под побочной диагональю
                if (0..<rows).contains((rows - 1) - j),
                   (j + i) < columns, i != 0,
                   board[(rows - 1) - j][j + i] != " " {
                        sideDiagonalDown.append(board[(rows - 1) - j][j + i])
                }
            }
            // проверяем диагонали
            if mainDiagonalDown.joined().contains(searchChar) ||
               mainDiagonalUp.joined().contains(searchChar) ||
               sideDiagonalUp.joined().contains(searchChar) ||
               sideDiagonalDown.joined().contains(searchChar) {
                    return true
            }
        }
        return false
    }
    
}
