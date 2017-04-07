//
//  GKEnemy.swift
//  FantasticFurryDrifters
//
//  Created by Aleksander Makedonski on 4/7/17.
//  Copyright © 2017 AlexMakedonski. All rights reserved.
//

import Foundation
import CoreMotion
import GameplayKit
import SpriteKit

class GKEnemy: GKEntity{
    
    init(texture: SKTexture, scalingFactor: CGFloat, defaultAction: SKAction, size: CGSize?, position: CGPoint?, motionManager: CMMotionManager? = nil){
        super.init()
        
        //Add GKSpriteComponent
        addSpriteComponent(texture: texture, scalingFactor: scalingFactor)
       
        //Add GKTransformComponent 
        addTransformComponent(position: position, size: size)

        //Add GKAnimationComponent
        addAnimationComponent(defaultAction: defaultAction)
        
    }
    
    private func addSpriteComponent(texture: SKTexture, scalingFactor: CGFloat){
        let spriteComponent = GKSpriteComponent(texture: texture)
        
        spriteComponent.node.xScale *= scalingFactor
        spriteComponent.node.yScale *= scalingFactor
        
        addComponent(spriteComponent)
        
    }
    
    private func addTransformComponent(position: CGPoint?, size: CGSize?){
       
        let randomPoint = RandomGenerator.getRandomScreenPoint()
        let randomSize = RandomGenerator.getRandomBoxSpriteSize(minSide: 100, maxSide: 200)

        let enemyPosition = position ?? randomPoint
        let enemySize = size ?? randomSize
        
        let transformComponent = GKTransformComponent(position: enemyPosition, size: enemySize)
        addComponent(transformComponent)
        transformComponent.setTransformPropertiesForParent()
        
    }
    
    private func addAnimationComponent(defaultAction: SKAction){
        let animationComponent = GKAnimationComponent(defaultAnimation: defaultAction)
        addComponent(animationComponent)
        animationComponent.runDefaultAnimation()

        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
