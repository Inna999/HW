//
//  main.swift
//  L22_IvanovaIA
//
//  Created by Inna on 19.09.2024.
//

import Foundation

print("Введите слово: ")

let wordRead = readLine()

if let word = wordRead {
    print(word == String(word.reversed()) ? "yes" : "no")
}

