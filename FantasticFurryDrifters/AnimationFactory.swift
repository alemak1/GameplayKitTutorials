//
//  AnimationFactory.swift
//  FantasticFurryDrifters
//
//  Created by Aleksander Makedonski on 4/9/17.
//  Copyright © 2017 AlexMakedonski. All rights reserved.
//

import Foundation
import SpriteKit


class AnimationFactory{
    
    //Singleton instance
    static let sharedInstance = AnimationFactory()
    
    
    //BasicAnimations
    var spikemanAnimation: SKAction = SKAction()
    var spikeballAnimation: SKAction = SKAction()
    var enemySunAnimation: SKAction = SKAction()
    var enemyCloudAnimation: SKAction = SKAction()
    var goldCoinAnimation: SKAction = SKAction()
    var silverCoinAnimation: SKAction = SKAction()
    var bronzeCoinAnimation: SKAction = SKAction()
    var regularCarrotAnimation: SKAction = SKAction()
    var goldCarrotAnimation: SKAction = SKAction()
    
    private init(){
        
        configureSpikemanAnimation()
        configureSpikeBallAnimation()
        configureEnemySunAnimation()
        configureEnemyCloudAnimation()
        configureGoldCoinAnimation()
        configureSilverCoinAnimation()
        configureBronzeCoinAnimation()
        configureRegularCarrotAnimation()
        configureGoldCarrotAnimation()
    
    }
    
    
    //Getter functions for all the basic animations
    func getSpikemanDefaultAnimation() -> SKAction{
        return spikemanAnimation
    }
    
    func getSpikeballDefaultAnimation() -> SKAction{
        return spikeballAnimation
    }
    
    func getEnemyCloudDefaultAnimation() -> SKAction{
        return enemyCloudAnimation
    }
    
    func getEnemySunDefaultAnimation() -> SKAction{
        return enemySunAnimation
    }
    
    func getGoldCoinDefaultAnimation() -> SKAction{
        return goldCoinAnimation
    }
    
    func getSilverCoinDefaultAnimation() -> SKAction{
        return silverCoinAnimation
    }
    
    func getBronzeCoinDefaultAnimation() -> SKAction{
        return bronzeCoinAnimation
    }
  
    func getRegularCarrotDefaultAnimation() -> SKAction{
        return regularCarrotAnimation
    }
    
    func getGoldCarrotDefaultAnimation() -> SKAction{
        return goldCarrotAnimation
    }
    
    private func configureSpikemanAnimation(){
        
        var texture1 = SKTexture(image: #imageLiteral(resourceName: "spikeMan_walk1"))
        var texture2 = SKTexture(image: #imageLiteral(resourceName: "spikeMan_walk2"))
        
        
        let walkAction = SKAction.animate(with: [
            texture1,
            texture2
            ], timePerFrame: 0.25)
        
        spikemanAnimation = walkAction

    }
    
    private func configureSpikeBallAnimation(){
        spikeballAnimation =  SKAction.animate(with: [
            SKTexture(image: #imageLiteral(resourceName: "spikeBall1")),
            SKTexture(image: #imageLiteral(resourceName: "spikeBall_2"))
            ], timePerFrame: 0.25)
        
    }
    
    private func configureEnemySunAnimation(){
        
        enemySunAnimation = SKAction.animate(with: [
            SKTexture(image: #imageLiteral(resourceName: "sun1")),
            SKTexture(image: #imageLiteral(resourceName: "sun2"))
            
            ], timePerFrame: 0.25)
        
        
    }
    
    private func configureEnemyCloudAnimation(){
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
        
        enemyCloudAnimation = scalingAction
        
    }
    
    private func configureGoldCoinAnimation(){
        
        let turnAction = SKAction.animate(with: [
            SKTexture(image: #imageLiteral(resourceName: "gold_1")),
            SKTexture(image: #imageLiteral(resourceName: "gold_2")),
            SKTexture(image: #imageLiteral(resourceName: "gold_3")),
            ], timePerFrame: 0.40)
        
        let reverseTurnAction = turnAction.reversed()
        
        let defaultAction = SKAction.sequence([
            turnAction,
            reverseTurnAction
            ])
        goldCoinAnimation = defaultAction
    }
    
    private func configureSilverCoinAnimation(){
        
        let turnAction =  SKAction.animate(with: [
            SKTexture(image: #imageLiteral(resourceName: "silver_1")),
            SKTexture(image: #imageLiteral(resourceName: "silver_2")),
            SKTexture(image: #imageLiteral(resourceName: "silver_3")),
            ], timePerFrame: 0.40)
        
        let reverseTurnAction = turnAction.reversed()
        
        let defaultAction = SKAction.sequence([
            turnAction,
            reverseTurnAction
            ])
        
        silverCoinAnimation = defaultAction
    }
    
    private func configureBronzeCoinAnimation(){
        
        let turnAction = SKAction.animate(with: [
            SKTexture(image: #imageLiteral(resourceName: "bronze_1")),
            SKTexture(image: #imageLiteral(resourceName: "bronze_2")),
            SKTexture(image: #imageLiteral(resourceName: "bronze_3")),
            ], timePerFrame: 0.40)
        
        let reverseTurnAction = turnAction.reversed()
        
        let defaultAction = SKAction.sequence([
            turnAction,
            reverseTurnAction
            ])
        
        bronzeCoinAnimation = defaultAction
        
    }
    
    private func configureRegularCarrotAnimation(){
        regularCarrotAnimation = SKAction.sequence([
            SKAction.rotate(byAngle: -0.5, duration: 0.50),
            SKAction.rotate(byAngle: 0.5, duration: 0.50)
            ])
    }
    
    private func configureGoldCarrotAnimation(){
        goldCarrotAnimation = SKAction.sequence([
            SKAction.rotate(byAngle: -0.5, duration: 0.50),
            SKAction.rotate(byAngle: 0.5, duration: 0.50)
            ])
    }
}
