//
//  readInput.swift
//  L14_IvanovaIA
//
//  Created by Inna on 16.09.2024.
//

import Foundation

func readInput() -> [Int] {
    print("Введите параметры: ")
    let parameters = readLine()
    guard let parameters else {
        return []
    }
    var resultInput = [Int]()
    var param: String = ""
    for char in parameters.trimmingCharacters(in: .whitespaces) {
        
        if char != " " {
            param.append(char)
        } else {
            resultInput.append(Int(param) ?? 0)
            param = ""
        }
    }
    // добавляем последний параметр
    resultInput.append(Int(param) ?? 0)
    
    return resultInput
}
