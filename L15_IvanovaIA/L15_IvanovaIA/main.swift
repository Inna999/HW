//
//  main.swift
//  L15_IvanovaIA
//
//  Created by Inna on 17.09.2024.
//

import Foundation

print("Введите URL-адрес:")
let urlRead = readLine()

if let url = urlRead {
    printParametersFromUrl(url)
}

