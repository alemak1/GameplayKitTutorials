//
//  SpriteComponent.swift
//  FantasticFurryDrifters
//
//  Created by Aleksander Makedonski on 4/6/17.
//  Copyright © 2017 AlexMakedonski. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit


class GKSpriteComponent: GKComponent{
    
    let node: SKSpriteNode
    
    init(texture: SKTexture){
        node = SKSpriteNode(texture: texture)
        node.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func resetAnchorPointTo(newAnchorPoint: CGPoint){
        node.anchorPoint = newAnchorPoint
    }
    
    func rotateTextureBy(radians: CGFloat){
        if let texture = node.texture{
            let rotationAction = SKAction.rotate(byAngle: radians, duration: 0.00)
            node.run(rotationAction)
        }
    }
    
    func scaleBy(scalingFactor: CGFloat){
        node.xScale *= scalingFactor
        node.yScale *= scalingFactor
    }
    
}
