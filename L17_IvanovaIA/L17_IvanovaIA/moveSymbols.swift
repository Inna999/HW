//
//  moveSymbols.swift
//  L17_IvanovaIA
//
//  Created by Inna on 17.09.2024.
//

import Foundation

func moveSymbols(_ word: String, on number: Int) -> String {
    var resultWord: String = word
    let movedSymbols = word.dropLast((word.count - number) > 0 ? (word.count - number) : 0)
    resultWord.removeFirst(min(word.count, number))
    resultWord += movedSymbols
    return resultWord
}
