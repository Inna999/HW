//
//  main.swift
//  L20_InanovaIA
//
//  Created by Inna on 19.09.2024.
//

import Foundation

print("Введите строку: ")
let stringRead = readLine()

if let string = stringRead {
    print(findEnglishSequence(string))
}

