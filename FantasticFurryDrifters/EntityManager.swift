//
//  EntityManager.swift
//  FantasticFurryDrifters
//
//  Created by Aleksander Makedonski on 4/7/17.
//  Copyright © 2017 AlexMakedonski. All rights reserved.
//

import Foundation
import GameplayKit
import SpriteKit

class EntityManager{
    var entities = Set<GKEntity>()
    let scene: SKScene
    
    init(scene: SKScene){
        self.scene = scene
    }
    
    func add(_ entity: GKEntity){
        entities.insert(entity)
        
        if let spriteNode = entity.component(ofType: GKSpriteComponent.self)?.node{
            scene.addChild(spriteNode)
        }
    }
    
    func remove(_ entity: GKEntity){
        if let spriteNode = entity.component(ofType: GKSpriteComponent.self)?.node{
            spriteNode.removeFromParent()
        }
        
        entities.remove(entity)
    }
}
