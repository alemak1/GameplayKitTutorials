//
//  Spikeman.swift
//  FantasticFurryDrifters
//
//  Created by Aleksander Makedonski on 4/6/17.
//  Copyright © 2017 AlexMakedonski. All rights reserved.
//

import Foundation
import SpriteKit

/**
 Spikeman walks along the edges of the screen in a back and forth motion
 
 **/

class Spikeman: SKSpriteNode{
    
    enum EdgeLocation{
        case Top,Right,Left,Bottom
    }
    
    var defaultAnimation = SKAction()
    var edgeWalkAnimation = SKAction()
    
    var edgeLocation: EdgeLocation = .Bottom
    var rotationAngle: Double = 0.00
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }
    
    convenience init(edgePosition: CGFloat?, size: CGSize?, scalingFactor: CGFloat = 1.00, edgeLocation: EdgeLocation) {
        
        
        var modifiedAnchorPoint: CGPoint
        var modifiedRotationAngle: Double
        var modifiedPosition: CGPoint
        var modifiedEdgePosition = edgePosition ?? 0.00
        
        switch(edgeLocation){
            case .Top:
                modifiedAnchorPoint = CGPoint(x: 0.5, y: 0.0)
                modifiedRotationAngle = M_PI
                modifiedPosition = CGPoint(x: Double(modifiedEdgePosition), y: Double(ScreenSizeConstants.HalfScreenHeight))
                break
            case .Right:
                modifiedAnchorPoint = CGPoint(x: 1.0, y: 0.0)
                modifiedRotationAngle = M_PI/2.0
                modifiedPosition = CGPoint(x: Double(ScreenSizeConstants.HalfScreenWidth), y: Double(modifiedEdgePosition))
                break
            case .Left:
                modifiedAnchorPoint = CGPoint(x: 0.0, y: 0.0)
                modifiedRotationAngle = -M_PI/2.0
                modifiedPosition = CGPoint(x: -Double(ScreenSizeConstants.HalfScreenWidth), y: Double(modifiedEdgePosition))
                break
            case .Bottom:
                modifiedAnchorPoint = CGPoint(x: 0.5, y: 0.0)
                modifiedRotationAngle = 0.00
                modifiedPosition = CGPoint(x: Double(modifiedEdgePosition), y: -Double(ScreenSizeConstants.HalfScreenHeight))
                break
        }
        
        let spikemanTexture = SKTexture(image: #imageLiteral(resourceName: "spikeMan_stand"))
        let textureSize = spikemanTexture.size()
        
        let spikemanSize = size ?? textureSize
        
        let spikemanPosition = modifiedPosition
        
        self.init(texture: spikemanTexture, color: .clear, size: spikemanSize)
        
        self.rotationAngle = modifiedRotationAngle
        self.anchorPoint = modifiedAnchorPoint
        self.run(SKAction.rotate(byAngle: CGFloat(rotationAngle), duration: 0.00))
     
        self.size = spikemanSize
        self.position = spikemanPosition
        
      
        configurePhysicsProperties(texture: spikemanTexture, size: spikemanSize)
        configureAnimations()
        configureEdgeWalkAnimation()
        
        self.xScale *= scalingFactor
        self.yScale *= scalingFactor
        
    }
    
    //MARK: *********** HELPER FUNCTIONS FOR INITIALIZTION
    
    /** The physics body for Spikeman must be initialized with a texture, since it's shape is very important for its function. The spike on top of his head should be precise to make gameplay for realistic and not avoid clashing with user expectations.
 
    **/
    private func configurePhysicsProperties(texture: SKTexture, size: CGSize){
        self.physicsBody = SKPhysicsBody(texture: texture, size: size)
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.isDynamic = false
        
        
    }
    
    private func configureAnimations(){
        
        var texture1 = SKTexture(image: #imageLiteral(resourceName: "spikeMan_walk1"))
        var texture2 = SKTexture(image: #imageLiteral(resourceName: "spikeMan_walk2"))
        
        rotateTexture(texture: &texture1)
        rotateTexture(texture: &texture2)
        
        let walkAction = SKAction.animate(with: [
                texture1,
                texture2
            ], timePerFrame: 0.25)
        
        defaultAnimation = SKAction.repeatForever(walkAction)
        
        self.run(defaultAnimation, withKey: "defaultAnimation")
        
    }
    
    
    private func rotateTexture(texture: inout SKTexture){
        var rotationAction: SKAction
        
        switch(edgeLocation){
        case .Bottom:
            rotationAction = SKAction.rotate(byAngle: 0.0, duration: 0.0)
            break
        case .Left:
            rotationAction = SKAction.rotate(byAngle: -CGFloat(M_PI)/2.0, duration: 0.0)
            break
        case .Right:
            rotationAction = SKAction.rotate(byAngle: CGFloat(M_PI)/2.0, duration: 0.0)
            break
        case .Top:
            rotationAction = SKAction.rotate(byAngle: CGFloat(M_PI), duration: 0.0)
            break
        }
        
        self.run(rotationAction)
    }
    
    private func configureEdgeWalkAnimation(){
        
        var startPoint: CGPoint
        var endPoint: CGPoint
        
        switch(edgeLocation){
     
            case .Bottom:
                startPoint = ScreenPoints.BottomLeftCorner
                endPoint = ScreenPoints.BottomRightCorner
                
                break
            case .Left:
                startPoint = ScreenPoints.TopLeftCorner
                endPoint = ScreenPoints.BottomLeftCorner
                
                break
            case .Right:
                startPoint = ScreenPoints.TopRightCorner
                endPoint = ScreenPoints.BottomRightCorner
                
                break
            case .Top:
                startPoint = ScreenPoints.TopLeftCorner
                endPoint = ScreenPoints.TopRightCorner
            
                break
        }
        
        let moveAction1 = SKAction.move(to: startPoint, duration: 3.00)
        let moveAction2 = SKAction.move(to: endPoint, duration: 3.00)
        
        let moveSequence = SKAction.sequence([
            moveAction1, moveAction2
            ])
        
        edgeWalkAnimation = SKAction.repeatForever(moveSequence)
        
    }
    
    func addEdgeWalkAnimation(){
        self.run(edgeWalkAnimation, withKey: "edgeWalkAnimation")
    }
    
    func removeEdgeWalkAnimation(){
        self.removeAction(forKey: "edgeWalkAnimation")
    }
    
}
