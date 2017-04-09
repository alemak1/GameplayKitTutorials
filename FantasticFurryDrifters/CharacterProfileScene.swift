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
    var profileSceneGameCharacter: GameCharacter = .Spikeman
    var animationNode = SKSpriteNode()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(size: CGSize) {
        super.init(size: size)
    }
    
    convenience init(size: CGSize, gameCharacter: GameCharacter) {
        self.init(size: size)
        self.profileSceneGameCharacter = gameCharacter
        print("Initializing CharacterProfileScene...")
        
        self.backgroundColor = ColorGenerator.getColor(colorType: .PeachYellow)
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        
        animationNode = SKSpriteNode(color: .clear, size: CGSize(width: 100, height: 100))
        animationNode.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        animationNode.position = CGPoint.zero
        animationNode.zPosition = 30
        self.addChild(animationNode)
    }
    
    
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        
        print("Creating the character animation....")
        
        switch(self.profileSceneGameCharacter){
        case .Spikeman:
            characterAnimation = SKAction.animate(with: [
                SKTexture(image: #imageLiteral(resourceName: "spikeMan_walk1")),
                SKTexture(image: #imageLiteral(resourceName: "spikeMan_walk2"))
                ], timePerFrame: 0.50)
            print("The character animation has been created!")
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
        
       
        
        
        animationNode.run(SKAction.repeatForever(characterAnimation))
        print("The animation node has been configured")
        

        
    }
    
    override func sceneDidLoad() {
        super.sceneDidLoad()
        
       
    }
}
