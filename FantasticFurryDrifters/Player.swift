//
//  Player.swift
//  FantasticFurryDrifters
//
//  Created by Aleksander Makedonski on 4/6/17.
//  Copyright © 2017 AlexMakedonski. All rights reserved.
//

import Foundation
import SpriteKit
import CoreMotion

class Player: SKSpriteNode{
    
    

    
    convenience init(scalingFactor: CGFloat = 0.30){
        
        let texture = SKTexture(image: #imageLiteral(resourceName: "RUrabbit"))
        let size = texture.size()
        
        self.init(texture: texture, color: .clear, size: size)
        
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.position = CGPoint.zero
        
        self.xScale *= scalingFactor
       self.yScale *= scalingFactor
    
        configurePhysicsProperties(physicsBodyRadius: size.width/2.0)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        
        super.init(texture: texture, color: color, size: size)
        
    }
    
    
    //MARK: *********** Helper Functions for Initialization
    
    func configurePhysicsProperties(physicsBodyRadius: CGFloat){
        self.physicsBody = SKPhysicsBody(circleOfRadius: physicsBodyRadius)
        self.physicsBody?.affectedByGravity = false

    }
    
    
    func respondToDeviceMotion(deviceMotion: CMDeviceMotion){
            let motionData = deviceMotion
        
            let verticalAttitude = -motionData.attitude.pitch
            let horizontalAttitude = motionData.attitude.roll
        
            let verticalRotationRate = -motionData.rotationRate.x
            let horizontalRotationRate = motionData.rotationRate.y
        
            var dxForce = 0.00
            var dyForce = 0.00
            
            /** If the phone is already tilted along one direction along its vertical axis (extending vertically from bottom of the phone to the top), the roll back towards zero rotation will not result in a vector being applied in the opposite; this prevents the player from accelerating in the opposite direction when the user rolls back towards the neutral position
 
            **/
            if((horizontalAttitude > 0.00 && horizontalRotationRate > 0.00) || (horizontalAttitude < 0.00 && horizontalRotationRate < 0.00)){
                dxForce = horizontalRotationRate*100.0
            }
        
            /** If phone is already titled in one direction with respect to horizontal axis (extending from left side of phone to right side), then force will not be applied in the opposite direction when user reverses the pitch back to a norma position
 
            **/
            if((verticalAttitude < 0.00 && verticalRotationRate < 0.00) || (verticalAttitude > 0.00 && verticalRotationRate > 0.00)){
                dyForce = verticalRotationRate*100.0
            }
        
            
            let appliedForceVector = CGVector(dx: dxForce, dy: dyForce)
        
            self.physicsBody?.applyForce(appliedForceVector)
            
        
    }
    

}
