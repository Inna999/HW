//
//  luckyNumber.swift
//  L21_IvanovaIA
//
//  Created by Inna on 19.09.2024.
//

import Foundation

func isLuckyNumber(_ number: Int) -> String {
    // разобъем число на массив цифр
    var numbers = [Int]()
    var num = number
    while num > 0 {
        numbers.append(num % 10)
        num /= 10
    }
    // проверка количества цифр в числе
    if numbers.count % 2 != 0 {
        return "Число с нечетным количеством цифр."
    }
    
    let sum1 = numbers[0...numbers.count/2 - 1].reduce(0, +)
    let sum2 = numbers[numbers.count / 2...numbers.count - 1].reduce(0, +)
    
    return sum1 == sum2 ? "Yes" : "No"
}
