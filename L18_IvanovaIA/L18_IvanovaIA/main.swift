//
//  main.swift
//  L18_IvanovaIA
//
//  Created by Inna on 18.09.2024.
//

import Foundation

print("Введите строку: ")

let word = readLine()

if var word {
    cutMiddle(&word)
    print(word)
}

