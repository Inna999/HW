//
//  main.swift
//  L18_IvanovaIA
//
//  Created by Inna on 18.09.2024.
//

import Foundation

print("Введите строку: ")

let wordRead = readLine()

if let word = wordRead {
    print(cutMiddle(word))
}

