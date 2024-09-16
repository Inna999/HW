//
//  readInput.swift
//  L14_IvanovaIA
//
//  Created by Inna on 16.09.2024.
//

import Foundation

func readInput() -> [Int] {
    print("Введите параметры: ")
    let parametersRead = readLine()
    guard let parameters = parametersRead else {
        return []
    }
    var resultInput = [Int]()
    for char in parameters {
        if char != " " {
            resultInput.append(char.wholeNumberValue ?? 0)
        }
    }
    return resultInput
}
