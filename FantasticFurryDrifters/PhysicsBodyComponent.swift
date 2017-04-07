//
//  PhysicsBodyComponent.swift
//  FantasticFurryDrifters
//
//  Created by Aleksander Makedonski on 4/6/17.
//  Copyright © 2017 AlexMakedonski. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit


class GKPhysicsBodyComponent: GKComponent{
    
    enum PhysicsBodyType{
        case Circle
        case Polygon
        case Rectangle
        case Texture
        case EdgeLoop
        case EdgeChain
        case Edge
    }
    
    enum PhysicsBodyCategory{
        case Default
        case Parent
    }
    
    var physicsBodyType: PhysicsBodyType = .Circle
    
    var defaultPhysicsBody: SKPhysicsBody?
    
    var parentPhysicsBody: SKPhysicsBody?{
        get{
            if let parentEntity = self.entity,let spriteComponent = parentEntity.component(ofType: GKSpriteComponent.self){
                return spriteComponent.node.physicsBody
            }
            
            return nil
        }
        
        set(newPhysicsBody){
            if let parentEntity = self.entity,let spriteComponent = parentEntity.component(ofType: GKSpriteComponent.self){
                spriteComponent.node.physicsBody = newPhysicsBody!
            }
            
        }
    }
    
    
    /** This component must be initialized generically with an optional default physics body (independent of the parent entity's physics body) and added to its entity before its parent entity's physics body can be set
 
     **/
    init(defaultPhysicsBody: SKPhysicsBody?) {
        super.init()
        
        self.defaultPhysicsBody = defaultPhysicsBody
    }
    
    /** The physics body of the parent can be set after the component has been initialized with a default physics body that is independent of that belonging to the parent; In this way, the physics body component can optionally be independent from the physics body of its parent
     **/
    func setPhysicsBodyForParent(physicsBodyType: PhysicsBodyType, circleRadius: CGFloat?, edgePoint1: CGPoint?, edgePoint2: CGPoint?, path: CGPath?, rectSize: CGSize?, rectCenter: CGPoint?, circleCenter: CGPoint?, texture: SKTexture?, textureSize: CGSize?){
        
        
        self.physicsBodyType = physicsBodyType
    
        switch(physicsBodyType){
            case .Circle:
                if let radius = circleRadius, let circleCenter = circleCenter{
                  parentPhysicsBody = SKPhysicsBody(circleOfRadius: radius, center: circleCenter)
                }
                break
            case .Edge:
                if let point1 = edgePoint1, let point2 = edgePoint2{
                  parentPhysicsBody = SKPhysicsBody(edgeFrom: point1, to: point2)
                }
                break
            case .EdgeChain:
                if let path = path{
                  parentPhysicsBody = SKPhysicsBody(edgeChainFrom: path)
                }
                break
            case .EdgeLoop:
                if let path = path{
                  parentPhysicsBody = SKPhysicsBody(edgeLoopFrom: path)
                }
                break
            case .Polygon:
                if let path = path{
                   parentPhysicsBody = SKPhysicsBody(polygonFrom: path)
                }
                break
            case .Texture:
                if let texture = texture, let textureSize = textureSize{
                  parentPhysicsBody = SKPhysicsBody(texture: texture, size: textureSize)
                }
                break
            case .Rectangle:
                if let rectSize = rectSize, let rectCenter = rectCenter{
                    parentPhysicsBody = SKPhysicsBody(rectangleOf: rectSize, center: rectCenter)
                }
                break
        }
        
    }
    
    func setParentPhysicsBodyToDefault(){
        parentPhysicsBody = self.defaultPhysicsBody
    }
    
    func setPhysicsPropertiesFor(physicsBodyCategory: PhysicsBodyCategory, affectedByGravity: Bool = false, allowsRotation: Bool = false){
        
        switch(physicsBodyCategory){
            case .Default:
                defaultPhysicsBody?.affectedByGravity = affectedByGravity
                defaultPhysicsBody?.allowsRotation = allowsRotation
                break
            case .Parent:
                parentPhysicsBody?.affectedByGravity = affectedByGravity
                parentPhysicsBody?.allowsRotation = allowsRotation
                break
        }
    }
   
    
    override func update(deltaTime seconds: TimeInterval) {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
