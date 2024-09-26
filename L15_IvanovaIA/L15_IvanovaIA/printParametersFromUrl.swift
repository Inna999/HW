//
//  printParametersFromUrl.swift
//  L15_IvanovaIA
//
//  Created by Inna on 17.09.2024.
//

import Foundation

func printParametersFromUrl(_ url: String) {
    var beginParameters: Bool = false
    var switchKey: Bool = true
    var key: String = ""
    var value: String = ""
    var password: String = ""
    let pass: String = "pass"
    
    for char in url {
        // пропускаем символы которые до параметров идут (до ?)
        if char == "?" {
            beginParameters = true
            continue
        }
        if beginParameters {
            // собираем ключ - значение
            switch switchKey {
            case true where char == "=":
                switchKey = false
            case true:
                key += String(char)
            case false where char == "&":
                switchKey = true
                // если попался пароль запоминаем
                if key == pass {
                    password = value
                }
                print("\(key) : \(!value.isEmpty ? value : "not found")")
                key = ""
                value = ""
            case false:
                value += String(char)
            }
        }
    }
    // обрабатываем последний параметр
    if !key.isEmpty {
        if key == pass {
            password = value
        }
        print("\(key) : \(!value.isEmpty ? value : "not found")")
    }
    // выводим пароль
    if !password.isEmpty {
        print("Password: \(password)")
    }
}
