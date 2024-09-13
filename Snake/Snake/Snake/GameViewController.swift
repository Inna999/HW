//
//  GameViewController.swift
//  Snake
//
//  Created by  Admin on 12.09.2024.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //созаем экземпляр сцены
        let scene = GameScene(size: view.bounds.size)
        //получаес главную область экрана
        let skView = view as! SKView
        //включаем произвольный порядок рендеринга проектов в узле
        skView.ignoresSiblingOrder = true
        //включаем отображение fps
        skView.showsFPS = true
        //показывать количество объектов на экране
        skView.showsNodeCount = true
        //режим отображения сцены, растягивается на все пространство
        scene.scaleMode = .resizeFill
        //добавляем сцену на экран
        skView.presentScene(scene)
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
