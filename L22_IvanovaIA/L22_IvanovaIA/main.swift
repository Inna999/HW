//
//  main.swift
//  L22_IvanovaIA
//
//  Created by Inna on 19.09.2024.
//

import Foundation

print("Введите слово: ")

let word = readLine()

if let word {
    print(word == String(word.reversed()) ? "yes" : "no")
}

