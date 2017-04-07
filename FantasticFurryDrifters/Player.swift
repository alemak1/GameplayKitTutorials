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
    
    

    
    convenience init(scalingFactor: CGFloat = 1.00){
        
        let texture = SKTexture(image: #imageLiteral(resourceName: "RUrabbit"))
        let size = texture.size()
        
        self.init(texture: texture, color: .clear, size: size)
        
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.position = CGPoint.zero
        
        self.xScale *= scalingFactor
       self.yScale *= scalingFactor
    
        configurePhysicsProperties()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        
        super.init(texture: texture, color: color, size: size)
        
    }
    
    
    //MARK: *********** Helper Functions for Initialization
    
    func configurePhysicsProperties(){
        let physicsBodyRadius = size.width/2.00
        self.physicsBody = SKPhysicsBody(circleOfRadius: physicsBodyRadius)
        self.physicsBody?.affectedByGravity = false

    }
    
    
    func respondToDeviceMotion(deviceMotion: CMDeviceMotion){
            let motionData = deviceMotion
        
            let verticalAttitude = -motionData.attitude.pitch
            let horizontalAttitude = motionData.attitude.roll
        
        
            print("The verticalAttitude is \(verticalAttitude)")
            print("The horizontalAttitude is: \(horizontalAttitude)")
        
            let verticalRotationRate = -motionData.rotationRate.x
            let horizontalRotationRate = motionData.rotationRate.y
        
            print("The verticalRotationRate is: \(verticalRotationRate)")
            print("The horizontalRotationRate is: \(horizontalRotationRate)")
            
            var dxImpulse = 0.00
            var dyImpulse = 0.00
            
            
            if((horizontalAttitude > 0.00 && horizontalRotationRate > 0.00) || (horizontalAttitude < 0.00 && horizontalRotationRate < 0.00)){
                dxImpulse = horizontalRotationRate
            }
            
            if((verticalAttitude < 0.00 && verticalRotationRate < 0.00) || (verticalAttitude > 0.00 && verticalRotationRate > 0.00)){
                dyImpulse = verticalRotationRate
            }
        
            
            let appliedImpulseVector = CGVector(dx: dxImpulse, dy: dyImpulse)
            self.physicsBody?.applyForce(appliedImpulseVector)
            
        
    }
    

}
