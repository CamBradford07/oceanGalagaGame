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
    
    var projectiles = [SKSpriteNode]()
    
    override func didMove(to view: SKView) {
        physicsWorld.contactDelegate = self
        
        player = self.childNode(withName: "player") as! SKSpriteNode
        score = self.childNode(withName: "score") as! SKLabelNode
        projectileNode = self.childNode(withName: "projectile") as! SKSpriteNode
        enemy1Node = self.childNode(withName: "enemy1") as! SKSpriteNode
        enemy2Node = self.childNode(withName: "enemy2") as! SKSpriteNode
        enemy3Node = self.childNode(withName: "enemy3") as! SKSpriteNode
        enemy4Node = self.childNode(withName: "enemy4") as! SKSpriteNode
        enemy5Node = self.childNode(withName: "enemy5") as! SKSpriteNode
        enemy6Node = self.childNode(withName: "enemy6") as! SKSpriteNode
        
        enemy1 = Enemy(node: enemy1Node, score: 50)
        enemy2 = Enemy(node: enemy2Node, score: 50)
        enemy3 = Enemy(node: enemy3Node, score: 50)
        enemy4 = Enemy(node: enemy4Node, score: 50)
        enemy5 = Enemy(node: enemy5Node, score: 50)
        enemy6 = Enemy(node: enemy6Node, score: 50)
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        
        for projectileIndex in stride(from: projectiles.count - 1, to: -1, by: -1){
            if projectiles[projectileIndex].position.y >= 717{
                projectiles[projectileIndex].removeFromParent()
                projectiles.remove(at: projectileIndex)
            }
        }
                
        }
    
    func didBegin(_ contact: SKPhysicsContact) {
        if contact.bodyA.node?.name == "projectile" && contact.bodyB.node?.name == "enemy" || contact.bodyA.node?.name == "enemy" && contact.bodyB.node?.name == "projectile"{
            scoreNum += enemy1.score
            score.text = "Score: \(scoreNum)"
            contact.bodyA.node?.removeFromParent()
            contact.bodyB.node?.removeFromParent()
        }
        
        if contact.bodyA.node?.name == "leftBarrier" && contact.bodyB.node?.name == "enemy" || contact.bodyA.node?.name == "enemy" && contact.bodyB.node?.name == "leftBarrier"{
            if contact.bodyA.node?.name == "enemy"{
                contact.bodyA.node?.physicsBody?.velocity.dx = 75
            }
            else{
                contact.bodyB.node?.physicsBody?.velocity.dx = 75
            }
        }
        
        if contact.bodyA.node?.name == "rightBarrier" && contact.bodyB.node?.name == "enemy" || contact.bodyA.node?.name == "enemy" && contact.bodyB.node?.name == "rightBarrier"{
            if contact.bodyA.node?.name == "enemy"{
                contact.bodyA.node?.physicsBody?.velocity.dx = -75
            }
            else{
                contact.bodyB.node?.physicsBody?.velocity.dx = -75
            }
        }
        
        if contact.bodyA.node?.name == "enemy" && contact.bodyB.node?.name == "enemy"{
            if Int((contact.bodyA.node?.position.x)!) < Int((contact.bodyB.node?.position.x)!){
                contact.bodyA.velocity.dx = -75
                contact.bodyB.velocity.dx = 75
            }
            else{
                contact.bodyA.velocity.dx = 75
                contact.bodyB.velocity.dx = -75
            }
        }
    }
    
    
    func shoot(){
        let projectile = projectileNode.copy() as! SKSpriteNode
        projectile.position = CGPoint(x: player.position.x, y: player.position.y + 25 + player.size.height / 2)
        projectile.physicsBody?.velocity = CGVector(dx: 0, dy: 500)
        self.addChild(projectile)
        projectiles.append(projectile)
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
    
    func generateEnemy(){
        let randomX = Double.random(in: -270...270)
        let randomEnemy = Int.random(in: 1...6)
        
        var xVelocity = 0
        if randomX < 0 {
            xVelocity = 75
        } else {
            xVelocity = -75
        }
        
        switch(randomEnemy){
        case 1:
            enemy1.generate(gameScene: self, startingPosition: CGPoint(x: randomX, y: 750), startingVelocity: CGVector(dx: xVelocity, dy: -100))
            
        case 2:
            enemy2.generate(gameScene: self, startingPosition: CGPoint(x: randomX, y: 750), startingVelocity: CGVector(dx: xVelocity, dy: -100))
            
        case 3:
            enemy3.generate(gameScene: self, startingPosition: CGPoint(x: randomX, y: 750), startingVelocity: CGVector(dx: xVelocity, dy: -100))
            
        case 4:
            enemy4.generate(gameScene: self, startingPosition: CGPoint(x: randomX, y: 750), startingVelocity: CGVector(dx: xVelocity, dy: -100))
            
        case 5:
            enemy5.generate(gameScene: self, startingPosition: CGPoint(x: randomX, y: 750), startingVelocity: CGVector(dx: xVelocity, dy: -100))
            
        case 6:
            enemy6.generate(gameScene: self, startingPosition: CGPoint(x: randomX, y: 750), startingVelocity: CGVector(dx: xVelocity, dy: -100))
            
        default:
            print("error!")
        }

    }
    
}
