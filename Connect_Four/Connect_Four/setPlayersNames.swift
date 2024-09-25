//
//  setPlayersNames.swift
//  Connect_Four
//
//  Created by Inna on 19.09.2024.
//

import Foundation

struct Player {
    let name: String
    let char: String
}
// определяем имена игроков
func setPlayersNames() -> (first: Player, second: Player) {
    print("First player's name: ")
    let firstPlayer = readLine()
    print("Second player's name: ")
    let secondPlayer = readLine()
    if let first = firstPlayer, let second = secondPlayer {
        if first == second {
            print("Input different names.")
            return setPlayersNames()
        }
        return(Player(name: first, char: "o"), Player(name: second, char: "*"))
    }
    return (Player(name: "1", char: "o"),(Player(name: "2", char: "*")))
}
