//
//  GKSpikemanLeft.swift
//  FantasticFurryDrifters
//
//  Created by Aleksander Makedonski on 4/7/17.
//  Copyright © 2017 AlexMakedonski. All rights reserved.
//

import Foundation
import GameplayKit
import SpriteKit
import CoreMotion

class GKSpikemanLeft: GKEnemy{
    
    init(scalingFactor: CGFloat, position: CGPoint?, movementLowerBound: CGFloat?, movementUpperBound: CGFloat?) {
        
        //Configure texture and size
        let texture = SKTexture(image: #imageLiteral(resourceName: "spikeMan_stand"))
        let textureSize = texture.size()
       
        
        //Configure default animation component
        let texture1 = SKTexture(image: #imageLiteral(resourceName: "spikeMan_walk1"))
        let texture2 = SKTexture(image: #imageLiteral(resourceName: "spikeMan_walk2"))
       
        let walkAction = SKAction.animate(with: [
            texture1,
            texture2
            ], timePerFrame: 0.25)
        
        
        let randomLeftEdgePoint = RandomGenerator.getRandomEdgePointFor(screenEdge: .Left)
        let spikeManPos = position ?? randomLeftEdgePoint
        
        super.init(texture: texture, scalingFactor: scalingFactor, defaultAction: walkAction, defaultActionName: "walkAction", size: textureSize, position: spikeManPos, motionManager: nil)
        
       
        
        //Reconfigure SpriteComponent
        if let spriteComponent = self.component(ofType: GKSpriteComponent.self){
            spriteComponent.rotateTextureBy(radians: -CGFloat(M_PI/2.00))
            spriteComponent.resetAnchorPointTo(newAnchorPoint: CGPoint(x: 0.5, y: 0.0))
        }
        
        //Animation Component: Add another animation component for the walking animation
        
        let moveAction1: SKAction = (movementUpperBound == nil) ?
            SKAction.move(to: ScreenPoints.TopLeftCorner, duration: 2.00) :
            SKAction.move(to: CGPoint(x: ScreenPoints.BottomLeftCorner.x , y: movementUpperBound!), duration: 2.00)

        let moveAction2: SKAction = (movementLowerBound == nil) ?
            SKAction.move(to: ScreenPoints.BottomLeftCorner, duration: 2.00) :
            SKAction.move(to: CGPoint(x: ScreenPoints.BottomLeftCorner.x , y: movementLowerBound!), duration: 2.00)
        
        
        let moveSequence = SKAction.sequence([moveAction1,moveAction2])
        
        let moveComponent = GKAnimationComponent(defaultAnimation: moveSequence, animationName: "moveAnimation")
        self.addComponent(moveComponent)
        moveComponent.runDefaultAnimation()
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
