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
    var pass: String = ""
    
    for char in url {
        // пропускаем символы которые до параметров идут (до ?)
        if char == "?" {
            beginParameters = true
            continue
        }
        if beginParameters {
            // собираем ключ
            if char != "=" && switchKey {
                key += String(char)
            // ключ закончился - переключаемся на значение
            } else if char == "=" && switchKey {
                switchKey = false
            // собираем значение
            } else if char != "&" && !switchKey {
                value += String(char)
            // выводим на печать
            } else if char == "&" && !switchKey {
                switchKey = true
                // если попался пароль запоминаем
                if key == "pass" {
                    pass = value
                }
                print("\(key) : \(value != "" ? value : "not found")")
                key = ""
                value = ""
            }
        }
    }
    // обрабатываем последний параметр
    if key != "" {
        if key == "pass" {
            pass = value
        }
        print("\(key) : \(value != "" ? value : "not found")")
    }
    // выводим пароль
    if pass != "" {
        print("Password: \(pass)")
    }
}
