//
//  GameViewController.swift
//  myLittlePonyGalagaGame
//
//  Created by CAMERON BRADFORD on 2/28/25.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    
    var gameScene = GameScene()
    var delay = 10.0

    @IBOutlet weak var rightbuttonOutlet: UIButton!
    
    @IBOutlet weak var leftButtonOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "GameScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                gameScene = scene as! GameScene
                // Present the scene
                view.presentScene(scene)
            }
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
            
            gameScene.generateEnemyLine()
        }
        
        let projectileTimer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { timer in
            self.gameScene.shoot()
            }
        let movementTimer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            if self.rightbuttonOutlet.isHighlighted {
                self.gameScene.moveRight()
            }
            else if self.leftButtonOutlet.isHighlighted {
                self.gameScene.moveLeft()
            }
            else{
                self.gameScene.stopMoving()
            }
            }
        let enemyTimer = Timer.scheduledTimer(withTimeInterval: delay, repeats: true) { timer in
            self.gameScene.generateEnemyLine()
            if self.delay > 2{
                self.delay -= 1
            }
        }
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    
    
}
