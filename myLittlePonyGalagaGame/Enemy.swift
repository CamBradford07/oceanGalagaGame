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
    var node: SKSpriteNode!
    var score : Int!
    var id: Int!
    static var Count = 0
    
    init(node: SKSpriteNode, score: Int) {
        self.node = node
        self.score = score
        id = Enemy.Count
        Enemy.Count += 1
    }
    
    func generate(gameScene : GameScene, startingPosition: CGPoint, startingVelocity: CGVector){
        let enemyNode = node.copy() as! SKSpriteNode
        enemyNode.position = startingPosition
        enemyNode.physicsBody?.velocity = startingVelocity
        enemyNode.physicsBody?.restitution = 1
                
        gameScene.addChild(enemyNode)

    }
    
}
