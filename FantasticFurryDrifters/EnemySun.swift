//
//  EnemySun.swift
//  FantasticFurryDrifters
//
//  Created by Aleksander Makedonski on 4/6/17.
//  Copyright © 2017 AlexMakedonski. All rights reserved.
//

import Foundation
import SpriteKit

class EnemySun: SKSpriteNode{
    
    var defaultAnimation = SKAction()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }
    
    convenience init(position: CGPoint?, size: CGSize?, scalingFactor: CGFloat = 1.00) {
        
        let sunTexture = SKTexture(image: #imageLiteral(resourceName: "sun1"))
        let textureSize = sunTexture.size()
        
        let sunSize = size ?? textureSize
        let sunPosition = position ?? RandomGenerator.getRandomScreenPoint()
        
        self.init(texture: sunTexture, color: .clear, size: sunSize)
        
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.size = sunSize
        self.position = sunPosition
        
        self.xScale *= scalingFactor
        self.yScale *= scalingFactor
        
        configurePhysicsProperties()
        configureAnimations()
        
    }
    
    //MARK: *********** HELPER FUNCTIONS FOR INITIALIZTION
    private func configurePhysicsProperties(){
        let radius = self.size.width/2.0
        self.physicsBody = SKPhysicsBody(circleOfRadius: radius)
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.isDynamic = false
        
        
    }
    
    private func configureAnimations(){
        let spinAction = SKAction.animate(with: [
            SKTexture(image: #imageLiteral(resourceName: "sun1")),
            SKTexture(image: #imageLiteral(resourceName: "sun2"))
            
            ], timePerFrame: 0.25)
        
        defaultAnimation = SKAction.repeatForever(spinAction)
        
        self.run(defaultAnimation, withKey: "defaultAnimation")
        
    }
    
    
 
}
