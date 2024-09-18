//
//  cutMiddle.swift
//  L18_IvanovaIA
//
//  Created by Inna on 18.09.2024.
//

import Foundation

func cutMiddle(_ word: String) -> String {
    var resultWord: String = word
    
    func removeMiddleChar () {
        resultWord.remove(
            at: resultWord.index(resultWord.startIndex, offsetBy: resultWord.count / 2)
        )
    }
    
    if word.count % 2 != 0 {
        removeMiddleChar()
    } else {
        removeMiddleChar()
        removeMiddleChar()
    }
    return resultWord
}
