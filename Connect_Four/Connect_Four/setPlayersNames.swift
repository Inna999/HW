//
//  setPlayersNames.swift
//  Connect_Four
//
//  Created by Inna on 19.09.2024.
//

import Foundation

//определяем тип Иргок
struct Player {
    let name: String
    let char: String
}

// определяем имена игроков и возвращаем экземпляры типа Иргок
func setPlayersNames() -> (first: Player, second: Player) {
    print("First player's name: ")
    let firstPlayer = readLine()
    print("Second player's name: ")
    let secondPlayer = readLine()
    
    if let firstPlayer, let secondPlayer {
        if firstPlayer == secondPlayer {
            print("Input different names.")
            return setPlayersNames()
        }
        return(Player(name: firstPlayer, char: "o"), Player(name: secondPlayer, char: "*"))
    }
    
    return (Player(name: "1", char: "o"),(Player(name: "2", char: "*")))
}
