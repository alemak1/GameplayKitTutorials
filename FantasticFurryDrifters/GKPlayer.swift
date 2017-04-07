//
//  Player.swift
//  FantasticFurryDrifters
//
//  Created by Aleksander Makedonski on 4/6/17.
//  Copyright © 2017 AlexMakedonski. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit
import CoreMotion

class GKPlayer: GKEntity{
    
    init(image: UIImage, scalingFactor: CGFloat, motionManager: CMMotionManager, position: CGPoint?, size: CGSize?, physicsBody: SKPhysicsBody? = SKPhysicsBody()){
        super.init()
        
        //Add GKSpriteComponent
        addSpriteComponent(image: image, scalingFactor: scalingFactor)
     
        //Add GKTransformComponent
        addTransformComponent(position: position, size: size)
        
        //Add GKPhysicsComponent (default component is independent of parent's entity GKSpriteNode component)
        addPhysicsComponent(physicsBody: physicsBody)
        
        //Add GKMotionResponderComponent
        addMotionResponderComponent(motionManager: motionManager)
        

        
       
    }
    
    func addSpriteComponent(image: UIImage, scalingFactor: CGFloat){
        let spriteComponent = GKSpriteComponent(texture: SKTexture(image: #imageLiteral(resourceName: "SOrabbit")))
        
        spriteComponent.node.xScale *= scalingFactor
        spriteComponent.node.yScale *= scalingFactor
        
        addComponent(spriteComponent)
    }
    
    /** The first size used is that provided by the user; if that is unavailable, then the size defaults to the SpriteComponent node's texture size; if that is unavailable, then the size defaults ot a hard-coded value
    **/
    func addTransformComponent(position: CGPoint?, size: CGSize?){
        
        let textureSize = component(ofType: GKSpriteComponent.self)?.node.size
        let defaultSize: CGSize? = textureSize ?? CGSize(width: 40, height: 40)
        
        let playerPosition = position ?? CGPoint.zero
        let playerSize = size ?? defaultSize
        
        let transformComponent = GKTransformComponent(position: playerPosition, size: playerSize)
        addComponent(transformComponent)
        transformComponent.setTransformPropertiesForParent()
        
    }
    
    /** If the GKSpriteComponent has been added, then the PhysicsBody will be based on the SpriteComponent's texture only; if it has not been added, then the physics body component will default to the user-provided physics body, which may be null
    
     **/
    private func addPhysicsComponent(physicsBody: SKPhysicsBody?){
        

        let physicsComponent: GKPhysicsBodyComponent = GKPhysicsBodyComponent(defaultPhysicsBody: physicsBody)
        addComponent(physicsComponent)
        
        if(physicsBody != nil){
            physicsComponent.setParentPhysicsBodyToDefault()
        }
        
        //Couple the GKPhysicsBodyComponent with the GKSpriteNodeComponent of the parent
        
        if let node = component(ofType: GKSpriteComponent.self)?.node{
    
            let circleRadius = node.size.width/2.0
            let circleCenter = node.position
        
            physicsComponent.setPhysicsBodyForParent(physicsBodyType: .Circle, circleRadius: circleRadius, edgePoint1: nil, edgePoint2: nil, path: nil, rectSize: nil, rectCenter: nil, circleCenter: circleCenter, texture: nil, textureSize: nil)
            physicsComponent.setPhysicsPropertiesFor(physicsBodyCategory: .Parent)
        }
        
    }
    
    private func addMotionResponderComponent(motionManager: CMMotionManager){
        let motionResponderComponent = GKMotionResponderComponent(motionManager: motionManager)
        addComponent(motionResponderComponent)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
