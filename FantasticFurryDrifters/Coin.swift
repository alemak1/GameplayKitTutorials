//
//  Coin.swift
//  FantasticFurryDrifters
//
//  Created by Aleksander Makedonski on 4/6/17.
//  Copyright © 2017 AlexMakedonski. All rights reserved.
//

import Foundation
import SpriteKit

class Coin: SKSpriteNode{
    
    enum CoinType{
        case Gold
        case Silver
        case Bronze
    }
    
    var defaultAnimation = SKAction()
    var coinType: CoinType
    
    required init?(coder aDecoder: NSCoder) {
        self.coinType = .Gold
        super.init(coder: aDecoder)
    }
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        self.coinType = .Gold
        super.init(texture: texture, color: color, size: size)
    }
    
    convenience init(position: CGPoint?, size: CGSize?, scalingFactor: CGFloat = 1.00, coinType: CoinType) {
        
        
        var coinTexture: SKTexture
        
        switch(coinType){
        case .Bronze:
            coinTexture = SKTexture(image: #imageLiteral(resourceName: "bronze_1"))
            break
        case .Silver:
            coinTexture = SKTexture(image: #imageLiteral(resourceName: "silver_1"))
            break
        case .Gold:
            coinTexture = SKTexture(image: #imageLiteral(resourceName: "gold_1"))
            break
        }
        
        let textureSize = coinTexture.size()
        
        let coinSize = size ?? textureSize
        let coinPosition = position ?? RandomGenerator.getRandomScreenPoint()
        
        self.init(texture: coinTexture, color: .clear, size: coinSize)
        
        self.coinType = coinType
        
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.size = coinSize
        self.position = coinPosition
        
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
        var turnAction: SKAction
        
        switch(coinType){
        case .Gold:
            turnAction = SKAction.animate(with: [
                SKTexture(image: #imageLiteral(resourceName: "gold_1")),
                SKTexture(image: #imageLiteral(resourceName: "gold_2")),
                SKTexture(image: #imageLiteral(resourceName: "gold_3")),
                ], timePerFrame: 0.40)
            break
        case .Silver:
            turnAction = SKAction.animate(with: [
                SKTexture(image: #imageLiteral(resourceName: "silver_1")),
                SKTexture(image: #imageLiteral(resourceName: "silver_2")),
                SKTexture(image: #imageLiteral(resourceName: "silver_3")),
                ], timePerFrame: 0.40)
            break
        case .Bronze:
            turnAction = SKAction.animate(with: [
                SKTexture(image: #imageLiteral(resourceName: "bronze_1")),
                SKTexture(image: #imageLiteral(resourceName: "bronze_2")),
                SKTexture(image: #imageLiteral(resourceName: "bronze_3")),
                ], timePerFrame: 0.40)
            break
        }
        
        let reverseTurnAction = turnAction.reversed()
        
        let defaultAction = SKAction.sequence([
            turnAction,
            reverseTurnAction
            ])
        defaultAnimation = SKAction.repeatForever(defaultAction)
        
        self.run(defaultAnimation, withKey: "defaultAnimation")
        
    }
    
}
