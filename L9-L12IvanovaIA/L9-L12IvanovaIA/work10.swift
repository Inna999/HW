//
//  work10.swift
//  L9-L12IvanovaIA
//
//  Created by Inna on 16.09.2024.
//

import Foundation

func work10() {
    print("""
    Работа 10.
    Напишите программу, которая читает комбинацию букв и цифр и печатает первую цифру в ней.
    Гарантируется, что в комбинации есть хотя бы одна цифра.

    Введите комбинацию:
    """)
    if let combination = readLine() {
        for char in combination {
            if char.isNumber {
                print("Первая цифра: \(char)")
                break
            }
        }
    }

}
