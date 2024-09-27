//
//  setBoardDemension.swift
//  Connect_Four
//
//  Created by Inna on 19.09.2024.
//

import Foundation

// определяем размер доски
func setBoardDimension() -> (rows: Int, columns: Int) {
    repeat {
        print("""
        Set the board dimensions (Rows x Columns)
        Press Enter for default (6 x 7)
        """)
        let boardDimensions = readLine()
        // установка значения доски по умолчанию 6x7
        if let boardDimensions, boardDimensions.isEmpty {
            return (6, 7)
        }
        
        if let board = boardDimensions?.filter({ !$0.isWhitespace }) {
            guard let xIndex = board.firstIndex(of: "x"),
                  let rows = Int(board[board.startIndex..<xIndex]),
                  let columns = Int(board[board.index(after: xIndex)..<board.endIndex])
            else {
                print("Invalid input")
                continue
            }
            if !(5...9).contains(rows) {
                print("Board rows should be from 5 to 9.")
            } else if !(5...9).contains(columns) {
                print("Board columns should be from 5 to 9.")
            } else {
                return(rows, columns)
            }
        }
    } while true
}
