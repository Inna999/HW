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
        if count == substring.count {
            repeating += 1
            count = 0
        }
        for ch in substring[substring.index(substring.startIndex, offsetBy: count)..<substring.endIndex] {
            if char != ch {
                count = 0
                break
            }
            count += 1
            break
        }
    }
    
    if count == substring.count {
        repeating += 1
    }
    
    return repeating
}
