//
//  multipleGame.swift
//  Connect_Four
//
//  Created by Inna on 23.09.2024.
//

import Foundation

// определяем количество игр
func multipleGame() -> Int {
    repeat {
        print("""
        Do you want to play single or multiple games?
        For a single game input 1 or press Enter
        Input a number of games:
        """)
        let count = readLine()
        if count == "" {
            return 1
        }
        if let input = Int(count ?? "0"), input > 0 {
            return input
        } else {
            print("Invalid input. Try again")
        }
    } while true
}
