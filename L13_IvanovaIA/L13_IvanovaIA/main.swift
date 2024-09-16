//
//  main.swift
//  L13_IvanovaIA
//
//  Created by Inna on 16.09.2024.
//

import Foundation

func readShipCoordinates() -> String? {
    print("Введите координаты корабля (через пробел):")
    let shipCoordinates = readLine()
    return shipCoordinates
}

var xCoordinate = [Int]()
var yCoordinate = [Int]()
for _ in 1...3 {
    let ship = readShipCoordinates()
    if let intX = ship?.first?.wholeNumberValue, let intY = ship?.last?.wholeNumberValue {
        xCoordinate.append(intX)
        yCoordinate.append(intY)
    }
}

let freeX = (1...5).filter() {!xCoordinate.contains($0)}
let freeY = (1...5).filter() {!yCoordinate.contains($0)}

print("Свободные строки:")
print(freeX.map { String($0) }.joined(separator: " "))
print("Свободные столбцы:")
print(freeY.map { String($0) }.joined(separator: " "))
