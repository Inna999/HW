//
//  main.swift
//  L19_IvanovaIA
//
//  Created by Inna on 18.09.2024.
//

import Foundation

print("Введите строку: ")
let stringRead = readLine()
print("Введите подстроку: ")
let substringRead = readLine()

if let string = stringRead, let substring = substringRead, string != "", substring != "" {
    print(countSubstring(in: string, substring))
}

