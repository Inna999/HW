//
//  countSubstring.swift
//  L19_IvanovaIA
//
//  Created by Inna on 18.09.2024.
//

import Foundation

func countSubstring(in string: String, _ substring: String) -> Int {
    var count: Int = 0
    var repeating: Int = 0
    for char in string {
        // нашли вхождение
        if count == substring.count {
            repeating += 1
            count = 0
        }
        // символ из подстроки
        let ch = substring[substring.index(substring.startIndex, offsetBy: count)]
        char != ch ? count = 0 : (count += 1)
    }
    // проверяем входжение в конце строки
    if count == substring.count {
        repeating += 1
    }
    return repeating
}
