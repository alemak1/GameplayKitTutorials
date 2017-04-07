//
//  Spikeball.swift
//  FantasticFurryDrifters
//
//  Created by Aleksander Makedonski on 4/6/17.
//  Copyright © 2017 AlexMakedonski. All rights reserved.
//

import Foundation
import SpriteKit


class Spikeball: SKSpriteNode{
    
    var defaultAnimation = SKAction()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }
    
    convenience init(position: CGPoint, size: CGSize) {
        
        let spikeBallTexture = SKTexture(image: #imageLiteral(resourceName: "spikeBall1"))
        let spikeBallSize = spikeBallTexture.size()
        
        self.init(texture: spikeBallTexture, color: .clear, size: spikeBallSize)
        
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.size = size
        self.position = position
        
        configurePhysicsProperties()
        configureAnimations()
        
    }
    
    //MARK: *********** HELPER FUNCTIONS FOR INITIALIZTION
    private func configurePhysicsProperties(){
        let radius = self.size.width/2.0
        self.physicsBody = SKPhysicsBody(circleOfRadius: radius)
        self.physicsBody?.affectedByGravity = false
    
        
    }

    private func configureAnimations(){
        let spinAction = SKAction.animate(with: [
            SKTexture(image: #imageLiteral(resourceName: "spikeBall1")),
            SKTexture(image: #imageLiteral(resourceName: "spikeBall_2"))
            ], timePerFrame: 0.25)
        
        defaultAnimation = SKAction.repeatForever(spinAction)
        
        self.run(defaultAnimation, withKey: "defaultAnimation")
        
    }
    
}
