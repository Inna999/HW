//
//  cutMiddle.swift
//  L18_IvanovaIA
//
//  Created by Inna on 18.09.2024.
//

import Foundation

func cutMiddle(_ word: inout String) {
    
    func removeMiddleChar () {
        word.remove(at: word.index(word.startIndex, offsetBy: word.count / 2))
    }
    
    if !word.count.isMultiple(of: 2) {
        removeMiddleChar()
    } else {
        removeMiddleChar()
        removeMiddleChar()
    }
}
