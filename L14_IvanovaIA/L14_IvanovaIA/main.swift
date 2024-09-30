//
//  main.swift
//  L14_IvanovaIA
//
//  Created by Inna on 16.09.2024.
//

import Foundation

var parameters = readInput()
while parameters.isEmpty {
    print("Параметры не заданы.")
    parameters = readInput()
}

print("Пароль: \(getPassword(parameters))")


