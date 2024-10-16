//
//  findEnglishSubsequence.swift
//  L20_InanovaIA
//
//  Created by Inna on 19.09.2024.
//

import Foundation
   
func findEnglishSequence(_ string: String) -> Bool {
    let alphabet: String = "abcdefghijklmnopqrstuvwxyz"
    if string.isEmpty {
        return true
    }
    return alphabet.contains(string)
}
