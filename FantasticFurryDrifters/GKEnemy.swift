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

class GKEnemy: GKEntity{
    
    init(image: UIImage, defaultAction: SKAction, size: CGSize?, position: CGPoint?, motionManager: CMMotionManager? = nil){
        super.init()
        
        //Add GKSpriteComponent
        addSpriteComponent(image: image)
       
        //Add GKTransformComponent 
        addTransformComponent(position: position, size: size)

        //Add GKAnimationComponent
        addAnimationComponent(defaultAction: defaultAction)
        
    }
    
    private func addSpriteComponent(image: UIImage){
        let spriteComponent = GKSpriteComponent(texture: SKTexture(image: image))
        addComponent(spriteComponent)
        
    }
    
    private func addTransformComponent(position: CGPoint?, size: CGSize?){
        let randomXPos = GKRandomDistribution(lowestValue: -Int(ScreenSizeConstants.HalfScreenWidth), highestValue: Int(ScreenSizeConstants.HalfScreenWidth)).nextInt()
        let randomYPos = GKRandomDistribution(lowestValue: -Int(ScreenSizeConstants.HalfScreenHeight), highestValue: Int(ScreenSizeConstants.HalfScreenHeight)).nextInt()
        let randomPoint = CGPoint(x: randomXPos, y: randomYPos)
        
        let randomWidth = GKRandomDistribution(lowestValue: 50, highestValue: 100).nextInt()
        let randomHeight = GKRandomDistribution(lowestValue: 50, highestValue: 100).nextInt()
        let randomSize = CGSize(width: randomWidth, height: randomHeight)
        
        let enemyPosition = position ?? randomPoint
        let enemySize = size ?? randomSize
        
        let transformComponent = GKTransformComponent(position: enemyPosition, size: enemySize)
        addComponent(transformComponent)
        transformComponent.setTransformPropertiesForParent()
        
    }
    
    private func addAnimationComponent(defaultAction: SKAction){
        let animationComponent = GKAnimationComponent(defaultAnimation: defaultAction)
        addComponent(animationComponent)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
