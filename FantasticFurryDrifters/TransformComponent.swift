//
//  TransformComponent.swift
//  FantasticFurryDrifters
//
//  Created by Aleksander Makedonski on 4/6/17.
//  Copyright © 2017 AlexMakedonski. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

/** This component holds the size and position data
 
 **/
class GKTransformComponent: GKComponent{
    
    
    var defaultSize: CGSize?
    var defaultPosition: CGPoint?
    
    var parentSize: CGSize?{
        
        get{
            if let parentEntity = self.entity, let spriteComponent = parentEntity.component(ofType: GKSpriteComponent.self){
                return spriteComponent.node.size
            }
            
            return nil
        }
        
        set(newSize){
            if let parentEntity = self.entity, let spriteComponent = parentEntity.component(ofType: GKSpriteComponent.self){
                
                spriteComponent.node.size = newSize!
            }
            
        }
    }
    
    var parentPosition: CGPoint?{
        get{
            if let parentEntity = self.entity, let spriteComponent = parentEntity.component(ofType: GKSpriteComponent.self){
                return spriteComponent.node.position
            }
            
            return nil
        }
        
        set(newPosition){
            if let parentEntity = self.entity, let spriteComponent = parentEntity.component(ofType: GKSpriteComponent.self){
                
                spriteComponent.node.position = newPosition!
            }
            
        }
    }
    
    init(position: CGPoint?, size: CGSize?){
        super.init()
        
        self.defaultSize = size
        self.defaultPosition = position
        
    }
    
    
    func setTransformPropertiesForParent(){
        parentSize = self.defaultSize
        parentPosition = self.defaultPosition
    }
    
    
    
    override func update(deltaTime seconds: TimeInterval) {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
