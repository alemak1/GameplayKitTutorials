//
//  EnemyCloud.swift
//  FantasticFurryDrifters
//
//  Created by Aleksander Makedonski on 4/6/17.
//  Copyright © 2017 AlexMakedonski. All rights reserved.
//

import Foundation
import SpriteKit

class EnemyCloud: SKSpriteNode{
    
    
    var defaultAnimation = SKAction()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }
    
    convenience init(position: CGPoint?, size: CGSize?, scalingFactor: CGFloat = 0.50) {
        
        let cloudTexture = SKTexture(image: #imageLiteral(resourceName: "enemyCloud"))
        let textureSize = cloudTexture.size()
        
        let cloudSize = size ?? textureSize
        let cloudPosition = position ?? RandomGenerator.getRandomScreenPoint()
        
        self.init(texture: cloudTexture, color: .clear, size: cloudSize)
        
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.size = cloudSize
        self.position = cloudPosition
        
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
        
        let actionGroup1 = SKAction.group([
            SKAction.scale(to: 0.5, duration: 0.50),
            SKAction.colorize(with: ColorGenerator.getColor(colorType: .LightGrey), colorBlendFactor: 1.00, duration: 0.50)
            ])
        
        let actionGroup2 = SKAction.group([
            SKAction.scale(to: 0.30, duration: 0.50),
            SKAction.colorize(with: ColorGenerator.getColor(colorType: .DarkGrey), colorBlendFactor: 1.00, duration: 0.50)

            ])
        
        let scalingAction = SKAction.sequence([
                actionGroup1,
                actionGroup2
            ])
        
        defaultAnimation = SKAction.repeatForever(scalingAction)
        
        self.run(defaultAnimation, withKey: "defaultAnimation")
        
    }
    
}
