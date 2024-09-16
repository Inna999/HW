//
//  work9.swift
//  L9-L12IvanovaIA
//
//  Created by Inna on 16.09.2024.
//

import Foundation

func work9() {
    print("""
    Работа 9.
    Напишите программу, которая читает слово и печатает все буквы алфавита, которые не используются в этом слове.
    Учитываются только строчные буквы.
        
    Введите слово:
    """)
    if let word = readLine() {
        // убираем повторы
        let wordSet = Set(word)
        let alphabet: String = "абвгдеёжзийклмнопрстуфхцчшщъыьэюя"
        // печатаем алфавит
        for char in alphabet {
            if !wordSet.contains(char) {
                print(char, terminator: " ")
            }
        }
    }
    print("\n")
}
