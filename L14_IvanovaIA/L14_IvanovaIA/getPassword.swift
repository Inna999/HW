//
//  getPassword.swift
//  L14_IvanovaIA
//
//  Created by Inna on 16.09.2024.
//

import Foundation

func getPassword(_ parameters: [Int]) -> String {
    let alphabet = "abcdefghijklmnopqrstuvwxyz"
    let N = parameters[3]
    var password: [String] = Array(repeating: "", count: N)
    
    // поиск рандомного места в пароле для нового символа
    func findPlace () -> Int {
        var place: Int = 0
        repeat {
            place = Int.random(in: 0..<N)
        } while !password[place].isEmpty
        return place
    }
    
    // функция добавления нового символа в пароль, в зависимости от переданого условия (прописные, строчные или цифры)
    func addNewChars(_ parameter: Int, place: Int, _ closure: () -> String?) {
        for _ in 0..<parameter {
            var charInstall: Bool = false
            repeat {
                if let newChar = closure(), 
                    password[max(place - 1, 0)] != newChar && password[min(place + 1, N - 1)] != newChar {   //проверка на повтор с соседними символами
                        password[place] = newChar
                        charInstall = true
                }
            } while !charInstall
                
        }
    }
    //добавляем прописные буквы
    addNewChars(parameters[0], place: findPlace()) { alphabet.randomElement()?.uppercased() }
 
    // добавляем строчные буквы
    addNewChars(parameters[1], place: findPlace()) { alphabet.randomElement()?.lowercased() }
    
    // добавляем цифры
    addNewChars(parameters[2], place: findPlace()) { String(Int.random(in: 0...9)) }
    
    // если не все символы заполнены - заполняем рандомно разными знаками
    for i in 0..<N {
        if password[i].isEmpty {
            let random = Int.random(in: 0...2)
            switch random{
            case 0:
                addNewChars(1, place: i) { alphabet.randomElement()?.uppercased() }
            case 1:
                addNewChars(1, place: i) { alphabet.randomElement()?.lowercased() }
            default:
                addNewChars(1, place: i) { String(Int.random(in: 0...9)) }
            }
        }
    }
   
    return password.joined()
}
