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
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
