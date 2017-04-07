//
//  AnimationComponent.swift
//  FantasticFurryDrifters
//
//  Created by Aleksander Makedonski on 4/7/17.
//  Copyright © 2017 AlexMakedonski. All rights reserved.
//

import Foundation
import GameplayKit

class GKAnimationComponent: GKComponent{
    
    var defaultAnimation: SKAction!
    var animationName: String!
    
    var parentNode: SKSpriteNode?{
        get{
            if let spriteNode = self.entity?.component(ofType: GKSpriteComponent.self)?.node{
                return spriteNode
            }
            return nil
        }
        
        set(newParentNode){
            if let spriteNode = self.entity?.component(ofType: GKSpriteComponent.self)?.node{
                parentNode = newParentNode!
            }
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    init(defaultAnimation: SKAction, animationName: String){
        super.init()
        
        self.defaultAnimation = defaultAnimation
        self.animationName = animationName
    }
    
    func runDefaultAnimation(){
        let defaultAnimation = SKAction.repeatForever(self.defaultAnimation)
        parentNode?.run(defaultAnimation, withKey: self.animationName)
    }
    
    func removeDefaultAnimation(){
        parentNode?.removeAction(forKey: self.animationName)
    }
    
}
