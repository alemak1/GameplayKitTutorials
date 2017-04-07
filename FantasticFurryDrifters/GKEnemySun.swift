//
//  GKEnemySun.swift
//  FantasticFurryDrifters
//
//  Created by Aleksander Makedonski on 4/7/17.
//  Copyright © 2017 AlexMakedonski. All rights reserved.
//

import Foundation
import GameplayKit
import SpriteKit


class GKEnemySun : GKEnemy{
    
    init(scalingFactor: CGFloat, position: CGPoint?) {
        
        let texture = SKTexture(image: #imageLiteral(resourceName: "sun1"))
        let textureSize = texture.size()
        
        let spinAction = SKAction.animate(with: [
            SKTexture(image: #imageLiteral(resourceName: "sun1")),
            SKTexture(image: #imageLiteral(resourceName: "sun2"))
            ], timePerFrame: 0.25)
        
        
        
        super.init(texture: texture, scalingFactor: scalingFactor, defaultAction: spinAction, defaultActionName: "spinAnimation", size: textureSize, position: position, motionManager: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
