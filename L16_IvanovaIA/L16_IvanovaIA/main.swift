//
//  main.swift
//  L16_IvanovaIA
//
//  Created by Inna on 17.09.2024.
//

import Foundation

print("Введите слово:")
let wordRead = readLine()

if let word = wordRead {
    print(makeHarmoniousWord(word))
}
