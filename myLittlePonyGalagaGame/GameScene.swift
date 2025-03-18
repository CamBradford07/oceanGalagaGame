//
//  GameScene.swift
//  myLittlePonyGalagaGame
//
//  Created by CAMERON BRADFORD on 2/28/25.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var player : SKSpriteNode!
    var score: SKLabelNode!
    var highScore: SKLabelNode!
    var finalScore: SKLabelNode!
    var finalHighScore: SKLabelNode!
    
    var projectileNode: SKSpriteNode!
    var enemy1Node: SKSpriteNode!
    var enemy2Node: SKSpriteNode!
    var enemy3Node: SKSpriteNode!
    var enemy4Node: SKSpriteNode!
    var enemy5Node: SKSpriteNode!
    var enemy6Node: SKSpriteNode!
    
    var enemy1: Enemy!
    var enemy2: Enemy!
    var enemy3: Enemy!
    var enemy4: Enemy!
    var enemy5: Enemy!
    var enemy6: Enemy!
    
    var scoreNum = 0
    var highScoreNum = 0
    
    var playerAlive = true
    
    var projectiles = [SKSpriteNode]()
    
    var defaults = UserDefaults.standard
    
    var cam = SKCameraNode()
    var area = "Game"
    
    override func didMove(to view: SKView) {
        physicsWorld.contactDelegate = self
        
        player = self.childNode(withName: "player") as! SKSpriteNode
        score = self.childNode(withName: "score") as! SKLabelNode
        highScore = self.childNode(withName: "highScore") as! SKLabelNode
        finalScore = self.childNode(withName: "finalScore") as! SKLabelNode
        finalHighScore = self.childNode(withName: "finalHighScore") as! SKLabelNode
        projectileNode = self.childNode(withName: "projectile") as! SKSpriteNode
        enemy1Node = self.childNode(withName: "enemy1") as! SKSpriteNode
        enemy2Node = self.childNode(withName: "enemy2") as! SKSpriteNode
        enemy3Node = self.childNode(withName: "enemy3") as! SKSpriteNode
        enemy4Node = self.childNode(withName: "enemy4") as! SKSpriteNode
        enemy5Node = self.childNode(withName: "enemy5") as! SKSpriteNode
        enemy6Node = self.childNode(withName: "enemy6") as! SKSpriteNode
        
        enemy1 = Enemy(node: enemy1Node, score: 20)
        enemy2 = Enemy(node: enemy2Node, score: 30)
        enemy3 = Enemy(node: enemy3Node, score: 40)
        enemy4 = Enemy(node: enemy4Node, score: 50)
        enemy5 = Enemy(node: enemy5Node, score: 60)
        enemy6 = Enemy(node: enemy6Node, score: 70)
        
        self.camera = cam
        
        highScoreNum = defaults.integer(forKey: "highScore")
        
        highScore.text = "High Score: \(highScoreNum)"

    }
    
    override func update(_ currentTime: TimeInterval) {
        
        for projectileIndex in stride(from: projectiles.count - 1, to: -1, by: -1){
            if projectiles[projectileIndex].position.y >= 717{
                projectiles[projectileIndex].removeFromParent()
                projectiles.remove(at: projectileIndex)
            }
        }
        
        if area == "Dead"{
            player.position.x = -2240
            area = "Game"
        }
                
        }
    
    func didBegin(_ contact: SKPhysicsContact) {
        if contact.bodyA.node?.name == "enemy1"{
            if contact.bodyB.node?.name == "projectile"{
                scoreNum += enemy1.score
                score.text = "Score: \(scoreNum)"
                contact.bodyA.node?.removeFromParent()
                contact.bodyB.node?.removeFromParent()
            }
            else if contact.bodyB.node?.name == "leftBarrier"{
                contact.bodyA.velocity.dx = 75
            }
            else if contact.bodyB.node?.name == "rightBarrier"{
                contact.bodyA.velocity.dx = -75
            }
            else if contact.bodyB.node?.name == "ground"{
                contact.bodyA.node?.removeFromParent()
            }
            else if contact.bodyB.node?.name == "player"{
                playerAlive = false
                if scoreNum > highScoreNum{
                    UserDefaults.standard.set(scoreNum, forKey: "highScore")
                    highScoreNum = scoreNum
                    }
                finalHighScore.text = "High Score: \(highScoreNum)"
                finalScore.text = "Final Score: \(scoreNum)"
                player.position.x = -2240
                cam.position.x = player.position.x
                area = "Dead"
                clearEnemies()
            }
        }
        if contact.bodyB.node?.name == "enemy1"{
            if contact.bodyA.node?.name == "projectile"{
                scoreNum += enemy1.score
                score.text = "Score: \(scoreNum)"
                contact.bodyA.node?.removeFromParent()
                contact.bodyB.node?.removeFromParent()
            }
            else if contact.bodyA.node?.name == "leftBarrier"{
                contact.bodyB.velocity.dx = 75
            }
            else if contact.bodyA.node?.name == "rightBarrier"{
                contact.bodyB.velocity.dx = -75
            }
            else if contact.bodyA.node?.name == "ground"{
                contact.bodyB.node?.removeFromParent()
            }
            else if contact.bodyA.node?.name == "player"{
                playerAlive = false
                if scoreNum > highScoreNum{
                    UserDefaults.standard.set(scoreNum, forKey: "highScore")
                    highScoreNum = scoreNum
                    }
                finalHighScore.text = "High Score: \(highScoreNum)"
                finalScore.text = "Final Score: \(scoreNum)"
                player.position.x = -2240
                cam.position.x = player.position.x
                area = "Dead"
                clearEnemies()
            }
        }
        
        if contact.bodyA.node?.name == "enemy2"{
            if contact.bodyB.node?.name == "projectile"{
                scoreNum += enemy2.score
                score.text = "Score: \(scoreNum)"
                contact.bodyA.node?.removeFromParent()
                contact.bodyB.node?.removeFromParent()
            }
            else if contact.bodyB.node?.name == "leftBarrier"{
                contact.bodyA.velocity.dx = 75
            }
            else if contact.bodyB.node?.name == "rightBarrier"{
                contact.bodyA.velocity.dx = -75
            }
            else if contact.bodyB.node?.name == "ground"{
                contact.bodyA.node?.removeFromParent()
            }
            else if contact.bodyB.node?.name == "player"{
                playerAlive = false
                if scoreNum > highScoreNum{
                    UserDefaults.standard.set(scoreNum, forKey: "highScore")
                    highScoreNum = scoreNum
                    }
                finalHighScore.text = "High Score: \(highScoreNum)"
                finalScore.text = "Final Score: \(scoreNum)"
                player.position.x = -2240
                cam.position.x = player.position.x
                area = "Dead"
                clearEnemies()
            }
        }
        if contact.bodyB.node?.name == "enemy2"{
            if contact.bodyA.node?.name == "projectile"{
                scoreNum += enemy2.score
                score.text = "Score: \(scoreNum)"
                contact.bodyA.node?.removeFromParent()
                contact.bodyB.node?.removeFromParent()
            }
            else if contact.bodyA.node?.name == "leftBarrier"{
                contact.bodyB.velocity.dx = 75
            }
            else if contact.bodyA.node?.name == "rightBarrier"{
                contact.bodyB.velocity.dx = -75
            }
            else if contact.bodyA.node?.name == "ground"{
                contact.bodyB.node?.removeFromParent()
            }
            else if contact.bodyA.node?.name == "player"{
                playerAlive = false
                if scoreNum > highScoreNum{
                    UserDefaults.standard.set(scoreNum, forKey: "highScore")
                    highScoreNum = scoreNum
                    }
                finalHighScore.text = "High Score: \(highScoreNum)"
                finalScore.text = "Final Score: \(scoreNum)"
                player.position.x = -2240
                cam.position.x = player.position.x
                area = "Dead"
                clearEnemies()
            }
        }

        if contact.bodyA.node?.name == "enemy3"{
            if contact.bodyB.node?.name == "projectile"{
                scoreNum += enemy3.score
                score.text = "Score: \(scoreNum)"
                contact.bodyA.node?.removeFromParent()
                contact.bodyB.node?.removeFromParent()
            }
            else if contact.bodyB.node?.name == "leftBarrier"{
                contact.bodyA.velocity.dx = 75
            }
            else if contact.bodyB.node?.name == "rightBarrier"{
                contact.bodyA.velocity.dx = -75
            }
            else if contact.bodyB.node?.name == "ground"{
                contact.bodyA.node?.removeFromParent()
            }
            else if contact.bodyB.node?.name == "player"{
                playerAlive = false
                if scoreNum > highScoreNum{
                    UserDefaults.standard.set(scoreNum, forKey: "highScore")
                    highScoreNum = scoreNum
                    }
                finalHighScore.text = "High Score: \(highScoreNum)"
                finalScore.text = "Final Score: \(scoreNum)"
                player.position.x = -2240
                cam.position.x = player.position.x
                area = "Dead"
                clearEnemies()
            }
        }
        if contact.bodyB.node?.name == "enemy3"{
            if contact.bodyA.node?.name == "projectile"{
                scoreNum += enemy3.score
                score.text = "Score: \(scoreNum)"
                contact.bodyA.node?.removeFromParent()
                contact.bodyB.node?.removeFromParent()
            }
            else if contact.bodyA.node?.name == "leftBarrier"{
                contact.bodyB.velocity.dx = 75
            }
            else if contact.bodyA.node?.name == "rightBarrier"{
                contact.bodyB.velocity.dx = -75
            }
            else if contact.bodyA.node?.name == "ground"{
                contact.bodyB.node?.removeFromParent()
            }
            else if contact.bodyA.node?.name == "player"{
                playerAlive = false
                if scoreNum > highScoreNum{
                    UserDefaults.standard.set(scoreNum, forKey: "highScore")
                    highScoreNum = scoreNum
                    }
                finalHighScore.text = "High Score: \(highScoreNum)"
                finalScore.text = "Final Score: \(scoreNum)"
                player.position.x = -2240
                cam.position.x = player.position.x
                area = "Dead"
                clearEnemies()
            }
        }
        
        if contact.bodyA.node?.name == "enemy4"{
            if contact.bodyB.node?.name == "projectile"{
                scoreNum += enemy4.score
                score.text = "Score: \(scoreNum)"
                contact.bodyA.node?.removeFromParent()
                contact.bodyB.node?.removeFromParent()
            }
            else if contact.bodyB.node?.name == "leftBarrier"{
                contact.bodyA.velocity.dx = 75
            }
            else if contact.bodyB.node?.name == "rightBarrier"{
                contact.bodyA.velocity.dx = -75
            }
            else if contact.bodyB.node?.name == "ground"{
                contact.bodyA.node?.removeFromParent()
            }
            else if contact.bodyB.node?.name == "player"{
                playerAlive = false
                if scoreNum > highScoreNum{
                    UserDefaults.standard.set(scoreNum, forKey: "highScore")
                    highScoreNum = scoreNum
                    }
                finalHighScore.text = "High Score: \(highScoreNum)"
                finalScore.text = "Final Score: \(scoreNum)"
                player.position.x = -2240
                cam.position.x = player.position.x
                area = "Dead"
                clearEnemies()
            }
        }
        if contact.bodyB.node?.name == "enemy4"{
            if contact.bodyA.node?.name == "projectile"{
                scoreNum += enemy4.score
                score.text = "Score: \(scoreNum)"
                contact.bodyA.node?.removeFromParent()
                contact.bodyB.node?.removeFromParent()
            }
            else if contact.bodyA.node?.name == "leftBarrier"{
                contact.bodyB.velocity.dx = 75
            }
            else if contact.bodyA.node?.name == "rightBarrier"{
                contact.bodyB.velocity.dx = -75
            }
            else if contact.bodyA.node?.name == "ground"{
                contact.bodyB.node?.removeFromParent()
            }
            else if contact.bodyA.node?.name == "player"{
                playerAlive = false
                if scoreNum > highScoreNum{
                    UserDefaults.standard.set(scoreNum, forKey: "highScore")
                    highScoreNum = scoreNum
                    }
                finalHighScore.text = "High Score: \(highScoreNum)"
                finalScore.text = "Final Score: \(scoreNum)"
                player.position.x = -2240
                cam.position.x = player.position.x
                area = "Dead"
                clearEnemies()
            }
        }
        
        if contact.bodyA.node?.name == "enemy5"{
            if contact.bodyB.node?.name == "projectile"{
                scoreNum += enemy5.score
                score.text = "Score: \(scoreNum)"
                contact.bodyA.node?.removeFromParent()
                contact.bodyB.node?.removeFromParent()
            }
            else if contact.bodyB.node?.name == "leftBarrier"{
                contact.bodyA.velocity.dx = 75
            }
            else if contact.bodyB.node?.name == "rightBarrier"{
                contact.bodyA.velocity.dx = -75
            }
            else if contact.bodyB.node?.name == "ground"{
                contact.bodyA.node?.removeFromParent()
            }
            else if contact.bodyB.node?.name == "player"{
                playerAlive = false
                if scoreNum > highScoreNum{
                    UserDefaults.standard.set(scoreNum, forKey: "highScore")
                    highScoreNum = scoreNum
                    }
                finalHighScore.text = "High Score: \(highScoreNum)"
                finalScore.text = "Final Score: \(scoreNum)"
                player.position.x = -2240
                cam.position.x = player.position.x
                area = "Dead"
                clearEnemies()
            }
        }
        if contact.bodyB.node?.name == "enemy5"{
            if contact.bodyA.node?.name == "projectile"{
                scoreNum += enemy5.score
                score.text = "Score: \(scoreNum)"
                contact.bodyA.node?.removeFromParent()
                contact.bodyB.node?.removeFromParent()
            }
            else if contact.bodyA.node?.name == "leftBarrier"{
                contact.bodyB.velocity.dx = 75
            }
            else if contact.bodyA.node?.name == "rightBarrier"{
                contact.bodyB.velocity.dx = -75
            }
            else if contact.bodyA.node?.name == "ground"{
                contact.bodyB.node?.removeFromParent()
            }
            else if contact.bodyA.node?.name == "player"{
                playerAlive = false
                if scoreNum > highScoreNum{
                    UserDefaults.standard.set(scoreNum, forKey: "highScore")
                    highScoreNum = scoreNum
                    }
                finalHighScore.text = "High Score: \(highScoreNum)"
                finalScore.text = "Final Score: \(scoreNum)"
                player.position.x = -2240
                cam.position.x = player.position.x
                area = "Dead"
                clearEnemies()
            }
        }
        
        if contact.bodyA.node?.name == "enemy6"{
            if contact.bodyB.node?.name == "projectile"{
                scoreNum += enemy6.score
                score.text = "Score: \(scoreNum)"
                contact.bodyA.node?.removeFromParent()
                contact.bodyB.node?.removeFromParent()
            }
            else if contact.bodyB.node?.name == "leftBarrier"{
                contact.bodyA.velocity.dx = 75
            }
            else if contact.bodyB.node?.name == "rightBarrier"{
                contact.bodyA.velocity.dx = -75
            }
            else if contact.bodyB.node?.name == "ground"{
                contact.bodyA.node?.removeFromParent()
            }
            else if contact.bodyB.node?.name == "player"{
                playerAlive = false
                if scoreNum > highScoreNum{
                    UserDefaults.standard.set(scoreNum, forKey: "highScore")
                    highScoreNum = scoreNum
                    }
                finalHighScore.text = "High Score: \(highScoreNum)"
                finalScore.text = "Final Score: \(scoreNum)"
                player.position.x = -2240
                cam.position.x = player.position.x
                area = "Dead"
                clearEnemies()
            }
        }
        if contact.bodyB.node?.name == "enemy6"{
            if contact.bodyA.node?.name == "projectile"{
                scoreNum += enemy6.score
                score.text = "Score: \(scoreNum)"
                contact.bodyA.node?.removeFromParent()
                contact.bodyB.node?.removeFromParent()
            }
            else if contact.bodyA.node?.name == "leftBarrier"{
                contact.bodyB.velocity.dx = 75
            }
            else if contact.bodyA.node?.name == "rightBarrier"{
                contact.bodyB.velocity.dx = -75
            }
            else if contact.bodyA.node?.name == "ground"{
                contact.bodyB.node?.removeFromParent()
            }
            else if contact.bodyA.node?.name == "player"{
                playerAlive = false
                if scoreNum > highScoreNum{
                    UserDefaults.standard.set(scoreNum, forKey: "highScore")
                    highScoreNum = scoreNum
                    }
                finalHighScore.text = "High Score: \(highScoreNum)"
                finalScore.text = "Final Score: \(scoreNum)"
                player.position.x = -2240
                cam.position.x = player.position.x
                area = "Dead"
                clearEnemies()
            }
        }
    }
    
    
    func shoot(){
        if playerAlive{
            let projectile = projectileNode.copy() as! SKSpriteNode
            projectile.position = CGPoint(x: player.position.x, y: player.position.y + 30 + player.size.height / 2)
            projectile.physicsBody?.velocity = CGVector(dx: 0, dy: 500)
            self.addChild(projectile)
            projectiles.append(projectile)
        }
    }
    
    func moveLeft(){
        player.physicsBody?.velocity.dx = -150
    }
    
    func moveRight(){
        player.physicsBody?.velocity.dx = 150
    }
    func stopMoving(){
        player.physicsBody?.velocity.dx = 0
    }
    
    func generateEnemy(xPlace: Double){
        let randomEnemy = Int.random(in: 1...6)
        
        switch(randomEnemy){
        case 1:
            enemy1.generate(gameScene: self, startingPosition: CGPoint(x: xPlace, y: 750), startingVelocity: CGVector(dx: -75, dy: -100))
            
        case 2:
            enemy2.generate(gameScene: self, startingPosition: CGPoint(x: xPlace, y: 750), startingVelocity: CGVector(dx: -75, dy: -100))
            
        case 3:
            enemy3.generate(gameScene: self, startingPosition: CGPoint(x: xPlace, y: 750), startingVelocity: CGVector(dx: -75, dy: -100))
            
        case 4:
            enemy4.generate(gameScene: self, startingPosition: CGPoint(x: xPlace, y: 750), startingVelocity: CGVector(dx: -75, dy: -100))
            
        case 5:
            enemy5.generate(gameScene: self, startingPosition: CGPoint(x: xPlace, y: 750), startingVelocity: CGVector(dx: -75, dy: -100))
            
        case 6:
            enemy6.generate(gameScene: self, startingPosition: CGPoint(x: xPlace, y: 750), startingVelocity: CGVector(dx: -75, dy: -100))
            
        default:
            print("error!")
        }

    }
    
    func generateEnemyLine(){
        if playerAlive{
            generateEnemy(xPlace: -300)
            generateEnemy(xPlace: -150)
            generateEnemy(xPlace: 0)
            generateEnemy(xPlace: 150)
            generateEnemy(xPlace: 300)
        }
    }
    
    func clearEnemies(){
        let nodes = self.children
        for node in nodes {
            switch node.name {
                case "enemy1":
                node.removeFromParent()
                case "enemy2":
                node.removeFromParent()
            case "enemy3":
                node.removeFromParent()
            case "enemy4":
                node.removeFromParent()
            case "enemy5":
                node.removeFromParent()
            case "enemy6":
                node.removeFromParent()
            default:
                print()
            }
        }
    }
    
}
