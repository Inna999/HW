//
//  main.swift
//  L17_IvanovaIA
//
//  Created by Inna on 17.09.2024.
//

import Foundation

print("Введите слово и число: ")
let stringRead = readLine()

if let string = stringRead {
    var word: String = ""
    var number: String = ""
    var numberSwitch: Bool = false
    for char in string {
        if char == " " {
            numberSwitch = true
            continue
        }
        if !numberSwitch {
            word.append(char)
        } else {
            number.append(char)
        }
    }
    if let num = Int(number) {
        print(moveSymbols(word, on: num))
    }
}
