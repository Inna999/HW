//
//  work12.swift
//  L9-L12IvanovaIA
//
//  Created by Inna on 16.09.2024.
//

import Foundation

func work12() {
    print("""
    Работа 12.
    Напишите программу, которая читает слово и печатает количество символов, встречающихся в нем только один раз.
    Введите слово:
    """)
    if let word = readLine() {
        var sortWord = word.sorted()
        var previousChar = sortWord.removeFirst()
        var count: Int = 0      // счетчик неповторяющихся символов
        var repeatChar: Bool = false
        for char in sortWord {
            if char == previousChar {
                repeatChar = true
            } else {
                previousChar = char
                if !repeatChar {
                    (count += 1)
                } else {
                    repeatChar = false
                }
            }
        }
        if !repeatChar { (count += 1) } // обрабатываем последний символ
        print("Количество символов, встречающихся только один раз: \(count)")
    }
}
