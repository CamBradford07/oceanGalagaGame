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
    
    var enemy1: Enemy!
    
    var scoreNum = 0
    
    var projectiles = [SKSpriteNode]()
    
    override func didMove(to view: SKView) {
        physicsWorld.contactDelegate = self
        
        player = self.childNode(withName: "player") as! SKSpriteNode
        score = self.childNode(withName: "score") as! SKLabelNode
        projectileNode = self.childNode(withName: "projectile") as! SKSpriteNode
        enemy1Node = self.childNode(withName: "enemy1") as! SKSpriteNode
        
        enemy1 = Enemy(node: enemy1Node, score: 50)
        
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
        enemy1.generate(gameScene: self, startingPosition: CGPoint(x: randomX, y: 750), startingVelocity: CGVector(dx: 0, dy: -100))
    }
    
}
