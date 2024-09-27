//
//  main.swift
//  L21_IvanovaIA
//
//  Created by Inna on 19.09.2024.
//

import Foundation

print("Ведите число: ")
let numberRead = readLine()
if let number = Int(numberRead!) {
    print(isLuckyNumber(number))
}

