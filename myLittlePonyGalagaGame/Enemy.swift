//
//  Enemy.swift
//  myLittlePonyGalagaGame
//
//  Created by CAMERON BRADFORD on 3/4/25.
//

import Foundation
import SpriteKit

class Enemy{
    var image: SKTexture!
    var startingPosition: CGPoint!
    var startingVelocity: CGVector!
    
    init(image: UIImage, startingPosition: CGPoint, startingVelocity: CGVector) {
        self.image = SKTexture(image: image)
        self.startingPosition = startingPosition
        self.startingVelocity = startingVelocity
    }
    
    func generate(gameScene : GameScene){
        let enemyNode = SKSpriteNode(texture: image, size: CGSize(width: 100, height: 100))
        
        let enemyPhysicsBody = SKPhysicsBody()
        
        enemyPhysicsBody.isDynamic = true
        enemyPhysicsBody.affectedByGravity = false
        enemyPhysicsBody.allowsRotation = false
        enemyPhysicsBody.pinned = false
        
        enemyPhysicsBody.contactTestBitMask = 1
        enemyPhysicsBody.categoryBitMask = 1
        
        enemyNode.physicsBody = enemyPhysicsBody
        
        enemyNode.position = startingPosition
        enemyNode.physicsBody?.velocity = startingVelocity
        
        gameScene.addChild(enemyNode)
        
    }
    
}
