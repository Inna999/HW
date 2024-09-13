//
//  SnakeBodyPart.swift
//  Snake
//
//  Created by  Admin on 12.09.2024.
//

import UIKit
import SpriteKit

class SnakeBodyPart: SKShapeNode {
    let diameter = 10.0
    
    init (atPoint point: CGPoint) {
        super.init()
        // рисуем круглый элемент
        path = UIBezierPath(ovalIn: CGRect(
            x: 0,
            y: 0,
            width: CGFloat(diameter),
            height: CGFloat(diameter))
        ).cgPath
        // цвет рамки и заливки
        fillColor = .green
        strokeColor = .green
        lineWidth = 5
        self.position = point
        // создаем физическое тело
        self.physicsBody = SKPhysicsBody(circleOfRadius: CGFloat(diameter - 4), center: CGPoint(x: 5, y: 5))
        // может перемещеться в пространстве
        self.physicsBody?.isDynamic = true
        // категория - змея
        self.physicsBody?.categoryBitMask = CollisionCategories.Snake
        // пересекается с границами экрана и яблоком
        self.physicsBody?.contactTestBitMask = CollisionCategories.EdgeBody | CollisionCategories.Apple
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
