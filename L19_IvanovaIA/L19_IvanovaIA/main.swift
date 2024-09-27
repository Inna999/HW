//
//  main.swift
//  L19_IvanovaIA
//
//  Created by Inna on 18.09.2024.
//

import Foundation

print("Введите строку: ")
let string = readLine()
print("Введите подстроку: ")
let substring = readLine()

if let string, let substring, !string.isEmpty, !substring.isEmpty {
    print(countSubstring(in: string, substring))
}

