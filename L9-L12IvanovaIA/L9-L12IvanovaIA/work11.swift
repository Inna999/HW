//
//  work11.swift
//  L9-L12IvanovaIA
//
//  Created by Inna on 16.09.2024.
//

import Foundation

func work11() {
    print("""
    Работа 11.
    Напишите программу, которая читает букву и печатает все предшествующие буквы английского алфавита.
    Введите букву:
    """)
    if let letter = readLine() {
        let engAlphabet: String = "abcdefghijklmnopqrstuvwxyz"
        
        for char in engAlphabet where char < Character(letter.lowercased()) {
            print(char, terminator: " ")
        }
    }
    print("\n")
}
