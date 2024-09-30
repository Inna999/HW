//
//  GameScene.swift
//  Snake
//
//  Created by  Admin on 12.09.2024.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    var snake: Snake?
    //запускается при первом запуске сцены
    override func didMove(to view: SKView) {
        // цвет фона сцены
        backgroundColor = SKColor.black
        //вектор и сила гравитации
        self.physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        //добавляем поддержку физики
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        //выключаем внешние воздействия на игру
        self.physicsBody?.allowsRotation = false
        //включаем отображение отладочной информации
        view.showsPhysics = true
        //поворот против часовой стрелки
        //создаем ноду (объект)
        let counterClockwiseButton = SKShapeNode()
        //задаем форму круга
        counterClockwiseButton.path =
            UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 45, height: 45)).cgPath
        //указываем координаты размещения
        counterClockwiseButton.position =
            CGPoint(x: view.scene!.frame.minX+30, y: view.scene!.frame.minY+30)
        //цвет заливки
        counterClockwiseButton.fillColor = UIColor.gray
        //цвет рамки
        counterClockwiseButton.strokeColor = UIColor.gray
        //толщина рамки
        counterClockwiseButton.lineWidth = 10
        //имя объекта для взаимодействия
        counterClockwiseButton.name = "counterClockwiseButton"
        //добавляем на сцену
        self.addChild(counterClockwiseButton)
        //поворот по часовой стрелке
        let clockwiseButton = SKShapeNode()
        clockwiseButton.path =
            UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 45, height: 45)).cgPath
        clockwiseButton.position =
            CGPoint(x: view.scene!.frame.maxX-80, y: view.scene!.frame.minY+30)
        clockwiseButton.fillColor = UIColor.gray
        clockwiseButton.strokeColor = UIColor.gray
        clockwiseButton.lineWidth = 10
        clockwiseButton.name = "clockwiseButton"
        self.addChild(clockwiseButton)
        // добавляем яблоко
        createApple()
        // создаем змею по центру экрана и добавляем ее на сцену
        snake = Snake(atPoint: CGPoint(x: view.scene!.frame.midX, y: view.scene!.frame.midY))
        self.addChild(snake!)
        // делаем сцену делегатом соприкосновений
        self.physicsWorld.contactDelegate = self
        // устанавливаем категорию взаимодействия с другими объектами
        self.physicsBody?.categoryBitMask = CollisionCategories.EdgeBody
        // устанавливаем категории, с которыми будут пересекаться края сцены
        self.physicsBody?.collisionBitMask = CollisionCategories.Snake | CollisionCategories.SnakeHead
    }
    
    // вызывается при нажатии на экран
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       // перебираем все точки, куда прикоснулся палец
        for touch in touches {
            // определяем координаты касания для точки
            let touchLocation = touch.location(in: self)
            // проверяем есть ли объект по этим координатам, и если есть - это наши кнопки
            guard let touchedNode = self.atPoint(touchLocation) as? SKShapeNode,
                  touchedNode.name == "counterClockwiseButton" ||
                    touchedNode.name == "clockwiseButton" else {
                        return
            }
            // если это наша кнопка - заливаем ее зеленым
            touchedNode.fillColor = .green
            // определяем какая кнопка нажата и поворачиваем в нужную сторону
            if touchedNode.name == "counterClockwiseButton" {
                snake!.moveCounterClockwise()
            } else if touchedNode.name == "clockwiseButton" {
                snake!.moveClockwise()
            }
        }
    }
    //вызывается при прекращении нажатия на экран
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
//            let touchLocation = touch.location(in: self)
//            
//            guard let touchedNode = self.atPoint(touchLocation) as? SKShapeNode,
//                  touchedNode.name == "counterClockwiseButton" ||
//                  touchedNode.name == "clockwiseButton"
//            else {
//                        return
//            }
            
            if let node = self.childNode(withName: "clockwiseButton") as? SKShapeNode,
               node.fillColor == .green {
                node.fillColor = .gray
            }
            if let node = self.childNode(withName: "counterClockwiseButton") as? SKShapeNode,
               node.fillColor == .green {
                node.fillColor = .gray
            }
            
        }
    }
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        snake!.move()
    }
    // создание яблока в случайной точке сцены
    func createApple() {
        // случайная точка на экране
        let randX =
            CGFloat(arc4random_uniform(UInt32(view!.scene!.frame.maxX-5)) + 1)
        let randY =
            CGFloat(arc4random_uniform(UInt32(view!.scene!.frame.maxY-5)) + 1)
        let apple = Apple(position: CGPoint(x: randX, y: randY))
        // добавляем яблоко на сцену
        self.addChild(apple)
    }
}

extension GameScene: SKPhysicsContactDelegate {
    // метод отслеживания начала столкновения
    func didBegin(_ contact: SKPhysicsContact) {
        // логическая сумма масок соприкоснувшихся объектов
        let bodyes = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        // вычитаем из суммы голову змеи, и у нас остается маска второго объекта
        let collisionObject = bodyes ^ CollisionCategories.SnakeHead
        // проверяемБ что это за второй объект
        switch collisionObject {
        case CollisionCategories.Apple:
            // вычисляем какой из объектов - яблоко
            let apple = contact.bodyA.node is Apple ? contact.bodyA.node : contact.bodyB.node
            // добавляем к змее еще одну секцию
            snake?.addBodyPart()
            // удаляем съеденное яблоко со сцены
            apple?.removeFromParent()
            // создаем новое яблоко
            createApple()
        case CollisionCategories.EdgeBody :
            // рестарт игры
            // удаляем старую змейку с экрана
            snake?.removeFromParent()
            // создаем новую змею по центру экрана и добавляем ее на сцену
            snake = Snake(atPoint: CGPoint(x: (view?.scene!.frame.midX)!, y: (view?.scene!.frame.midY)!))
            self.addChild(snake!)
        default:
            break
        }
    }
}

// категория пересечения объектов
struct CollisionCategories {
    /// тело змеи
    static let Snake: UInt32 = 0x1 << 0
    /// голова змеи
    static let SnakeHead: UInt32 = 0x1 << 1
    /// яблоко
    static let Apple: UInt32 = 0x1 << 2
    /// край сцены
    static let EdgeBody: UInt32 = 0x1 << 3
}
