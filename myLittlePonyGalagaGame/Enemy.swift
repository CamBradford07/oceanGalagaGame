//
//  Enemy.swift
//  myLittlePonyGalagaGame
//
//  Created by CAMERON BRADFORD on 3/4/25.
//

import Foundation
import SpriteKit
import GameplayKit

class Enemy{
    var image: SKTexture!
    var startingPosition: CGPoint!
    var startingVelocity: CGVector!
    var id: Int!
    static var Count = 0
    
    init(image: UIImage, startingPosition: CGPoint, startingVelocity: CGVector) {
        self.image = SKTexture(image: image)
        self.startingPosition = startingPosition
        self.startingVelocity = startingVelocity
        id = Enemy.Count
        Enemy.Count += 1
    }
    
    func generate(gameScene : GameScene){
        let enemyNode = SKSpriteNode(texture: image, size: CGSize(width: 100, height: 100))
        
        let enemyPhysicsBody = SKPhysicsBody(texture: enemyNode.texture!, size: enemyNode.size)
        
        enemyPhysicsBody.isDynamic = true
        enemyPhysicsBody.affectedByGravity = false
        enemyPhysicsBody.allowsRotation = false
        enemyPhysicsBody.pinned = false
        
        enemyPhysicsBody.contactTestBitMask = 1
        enemyPhysicsBody.categoryBitMask = 1
        
        enemyPhysicsBody.restitution = 0
        enemyPhysicsBody.friction = 0
        enemyPhysicsBody.linearDamping = 0
        
        enemyNode.physicsBody = enemyPhysicsBody
        
        enemyNode.position = startingPosition
        enemyNode.physicsBody?.velocity = startingVelocity
        enemyNode.zPosition = 0
        
        enemyNode.name = "enemy"
                
        gameScene.addChild(enemyNode)

    }
    
}
