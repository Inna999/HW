//
//  Apple.swift
//  Snake
//
//  Created by  Admin on 12.09.2024.
//

import UIKit
import SpriteKit
//Яблоко
class Apple: SKShapeNode {
    //определяем как оно будет отрисовываться
    convenience init(position: CGPoint) {
        self.init()
        // рисуем круг
        path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 10, height: 10)).cgPath
        // заливаем красным
        fillColor = .red
        strokeColor = .red
        lineWidth = 5
        self.position = position
        // добавляем физическое тело, совпадающее с изображением яблока
        self.physicsBody = SKPhysicsBody(circleOfRadius: 10.0, center: CGPoint(x: 5, y: 5))
        
        self.physicsBody?.categoryBitMask = CollisionCategories.Apple
    }
}
