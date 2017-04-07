//
//  Carrot.swift
//  FantasticFurryDrifters
//
//  Created by Aleksander Makedonski on 4/6/17.
//  Copyright © 2017 AlexMakedonski. All rights reserved.
//

import Foundation
import SpriteKit

class Carrot: SKSpriteNode{
    
    enum CarrotType{
        case Regular
        case Gold
    }
    
    var defaultAnimation = SKAction()
    var carrotType: CarrotType = .Regular
    
    required init?(coder aDecoder: NSCoder) {
    
        super.init(coder: aDecoder)
    }
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }
    
    convenience init(position: CGPoint?, size: CGSize?, scalingFactor: CGFloat = 1.00, carrotType: CarrotType) {
        
        var carrotTexture: SKTexture
        
        switch(carrotType){
            case .Gold:
                carrotTexture = SKTexture(image: #imageLiteral(resourceName: "carrot_gold"))
                break
            case .Regular:
                carrotTexture = SKTexture(image: #imageLiteral(resourceName: "carrot"))
                break
        }
        
      
        let textureSize = carrotTexture.size()
        
        let carrotSize = size ?? textureSize
        let carrotPosition = position ?? RandomGenerator.getRandomScreenPoint()
        
        self.init(texture: carrotTexture, color: .clear, size: carrotSize)
        
        self.carrotType = carrotType
        
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.size = carrotSize
        self.position = carrotPosition
        
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
        var rotateAction: SKAction
        
        switch(carrotType){
        case .Regular:
            rotateAction = SKAction.sequence([
                SKAction.rotate(byAngle: -0.5, duration: 0.50),
                SKAction.rotate(byAngle: 0.5, duration: 0.50)
                ])
            break
        case .Gold:
            rotateAction = SKAction.sequence([
                SKAction.rotate(byAngle: -0.5, duration: 0.50),
                SKAction.rotate(byAngle: 0.5, duration: 0.50)
                ])
            break
        }
        
        defaultAnimation = SKAction.repeatForever(rotateAction)
        
        self.run(defaultAnimation, withKey: "defaultAnimation")
        
    }
    
    
}
