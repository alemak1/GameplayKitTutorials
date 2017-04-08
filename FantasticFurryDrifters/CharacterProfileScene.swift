//
//  CharacterProfileScene.swift
//  FantasticFurryDrifters
//
//  Created by Aleksander Makedonski on 4/8/17.
//  Copyright © 2017 AlexMakedonski. All rights reserved.
//

import Foundation
import SpriteKit


class CharacterProfileScene: SKScene{
    
    
    var characterAnimation = SKAction()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(size: CGSize) {
        super.init(size: size)
    }
    
    convenience init(size: CGSize, gameCharacter: GameCharacter) {
        self.init(size: size)
        
        switch(gameCharacter){
        case .Spikeman:
            characterAnimation = SKAction.animate(with: [
                SKTexture(image: #imageLiteral(resourceName: "spikeMan_walk1")),
                SKTexture(image: #imageLiteral(resourceName: "spikeMan_walk2"))
                ], timePerFrame: 0.50)
            break
        case .Spikeball:
            break
        case .EnemySun:
            break
        case .EnemyCloud:
            break
        case .GoldCoin:
            break
        case .SilverCoin:
            break
        case .BronzeCoin:
            break
        default:
            break
        }
    }
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        let animationNode = SKSpriteNode()
        animationNode.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        animationNode.position = CGPoint.zero
        self.addChild(animationNode)
        
        
        animationNode.run(SKAction.repeatForever(characterAnimation))
        
    }
    
    override func sceneDidLoad() {
        super.sceneDidLoad()
        
    }
}
