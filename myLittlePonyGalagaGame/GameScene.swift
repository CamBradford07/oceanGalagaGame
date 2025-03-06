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
    
    var projectiles = [SKSpriteNode]()
    
    override func didMove(to view: SKView) {
        physicsWorld.contactDelegate = self
        
        player = self.childNode(withName: "player") as! SKSpriteNode
        
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        
        for projectileIndex in stride(from: projectiles.count - 1, to: -1, by: -1){
            if projectiles[projectileIndex].position.y >= 717{
                projectiles[projectileIndex].removeFromParent()
                projectiles.remove(at: projectileIndex)
            }
        }
                
        }
    
    
    func shoot(){
        let projectile = SKSpriteNode(color: .blue, size: CGSize(width: 10, height: 50))
        projectile.position = CGPoint(x: player.position.x, y: player.position.y + 25 + player.size.height / 2)
        let body = SKPhysicsBody()
        body.affectedByGravity = false
        body.isDynamic = true
        body.allowsRotation = false
        body.pinned = false
        body.restitution = 0
        body.friction = 0
        body.categoryBitMask = 1
        body.contactTestBitMask = 1
        body.velocity = CGVector(dx: 0, dy: 500)
        projectile.physicsBody = body
        projectile.zPosition = 0
        projectile.name = "projectile"
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
        
        let enemy = Enemy(image: UIImage(named: "ponyEnemy1")!, startingPosition: CGPoint(x: randomX, y: 800), startingVelocity: CGVector(dx: 0, dy: -75))
        
        enemy.generate(gameScene : self)
    }
    
}
