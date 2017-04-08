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
    var toRemove = Set<GKEntity>()
    
    let scene: EnemyAgentScene
    
    lazy var componentSystems: [GKComponentSystem] = {
        let motionResponderSystem = GKComponentSystem(componentClass: GKMotionResponderComponent.self)
        return [motionResponderSystem]
    }()
    
    init(scene: EnemyAgentScene){
        self.scene = scene
    }
    
    
    func update(_ deltaTime: CFTimeInterval){
        for componentSystem in componentSystems{
            componentSystem.update(deltaTime: deltaTime)
        }
        
        for currentRemove in toRemove{
            for componentSystem in componentSystems{
                componentSystem.removeComponent(foundIn: currentRemove)
            }
        }
        
        toRemove.removeAll()
    }
    
    func add(_ entity: GKEntity){
        entities.insert(entity)
        
        if let spriteNode = entity.component(ofType: GKSpriteComponent.self)?.node{
            scene.world?.addChild(spriteNode)
        }
        
        for componentSystem in componentSystems{
            componentSystem.addComponent(foundIn: entity)
        }
    }
    
    func remove(_ entity: GKEntity){
        if let spriteNode = entity.component(ofType: GKSpriteComponent.self)?.node{
            spriteNode.removeFromParent()
        }
        
        entities.remove(entity)
        toRemove.insert(entity)
    }
    
    func getGKPlayerEntities() -> [GKPlayer]{
        return self.entities.flatMap{entity in
            
            if let entity = entity as? GKPlayer{
                return entity
            }
            
            return nil
        }
    }
    
    func getCurrentUserPlayer() -> GKPlayer?{
        
        let players = getGKPlayerEntities()
        
        for player in players{
            if player.playerIsCurrentUser(){
                return player
            }
        }
        
        return nil
    }
    
    func getGKEnemyEntities() -> [GKEnemy]{
        return self.entities.flatMap{ entity in
            
            if let entity = entity as? GKEnemy{
                return entity
            }
        
            return nil
        }
    }
}
