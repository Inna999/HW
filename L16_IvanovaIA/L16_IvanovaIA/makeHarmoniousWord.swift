//
//  makeHarmoniousWord.swift
//  L16_IvanovaIA
//
//  Created by Inna on 17.09.2024.
//

import Foundation

func makeHarmoniousWord(_ word: String) -> Int {
    let vowels: String = "aeiouy"
    /// счетчик количества повторений
    var repeatCount: Int = 1
    /// переключатель гласные/согласные
    var vowelSwitch: Bool
    var result: Int = 0
    
    /// функция определения гласная - согласная
    func identifyVowel(_ char: Character) -> Bool {
        if vowels.contains(char) {
            return true
        } else {
            return false
        }
    }
    
    // Первый символ определим отдельно
    var wordNew: String = word
    let firstChar: Character = wordNew.removeFirst()
    vowelSwitch = identifyVowel(firstChar)
    
    for char in wordNew {
        // если согласная или гласная повторяется
        if (vowels.contains(char) && vowelSwitch)
            || (!vowels.contains(char) && !vowelSwitch) {
                repeatCount += 1
        } else {
            if repeatCount > 2 {
                result += (repeatCount - 1) / 2
            }
            repeatCount = 1
            vowelSwitch = identifyVowel(char)
        }
    }
    // если повтор был в конце слова
    if repeatCount > 2 {
        result += (repeatCount - 1) / 2
    }
    return result
}
