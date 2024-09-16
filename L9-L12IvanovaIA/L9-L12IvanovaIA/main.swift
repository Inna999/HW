//
//  main.swift
//  L9-L12IvanovaIA
//
//  Created by Inna on 16.09.2024.
//

import Foundation

func readWorkNumber() -> String {
    repeat {
        print("Введите номер задачи (9, 10, 11 или 12):")
        let workArray = ["9", "10", "11", "12"]
        if let work = readLine() {
            if workArray.contains(work) {
                return work
            } else {
                print("Значение введено не верно!")
            }
        }
    } while true
}

var exit = false
repeat {
    let work = readWorkNumber()
    switch work {
    case "9":
        work9()
    case "10":
        work10()
    case "11":
        work11()
    case "12":
        work12()
    default:
        print("")
    }
    print("Хотите продолжать? (y/n)")
    if let continueWork = readLine() {
        if continueWork.lowercased() == "n" {
            exit = true
        }
    }
} while !exit
