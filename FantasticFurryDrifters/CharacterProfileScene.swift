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
    
    //MARK: ******* AnimationsFactory Singleton
    let animationsFactory = AnimationFactory.sharedInstance
    
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
        
        //Set background color and anchor point for the scene
        self.backgroundColor = ColorGenerator.getColor(colorType: .PeachYellow)
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
       
    }
    
    
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        //Configure the character animation that run by the animation node
        configureCharacterAnimation()
        
        //Initialize the animation node
        guard let characterTexture = profileSceneGameCharacter.basicTexture else { return }
        
        animationNode = SKSpriteNode(texture: characterTexture)
        animationNode.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        animationNode.position = CGPoint.zero
        animationNode.zPosition = 30
        animationNode.run(SKAction.setTexture(characterTexture))
        
        self.addChild(animationNode)
        
       
        animationNode.run(SKAction.repeatForever(characterAnimation))
        

        
    }
    
    private func configureCharacterAnimation(){
        if let basicAnimation = profileSceneGameCharacter.basicAnimation{
            characterAnimation = basicAnimation

        }
    }
}
