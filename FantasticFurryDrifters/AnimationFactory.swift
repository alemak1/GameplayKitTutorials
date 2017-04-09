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
    
    
    //TextureAtlasManager singleton
    let textureAtlasManager = TextureAtlasManager.sharedInstance
    
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
        
        guard let texture1 = textureAtlasManager.getTextureAtlas(atlasType: .SpikeMan)?.textureNamed("spikeMan_walk1"), let texture2 = textureAtlasManager.getTextureAtlas(atlasType: .SpikeMan)?.textureNamed("spikeMan_walk2") else { return }
        
        
        let walkAction = SKAction.animate(with: [
            texture1,
            texture2
            ], timePerFrame: 0.25)
        
        spikemanAnimation = walkAction

    }
    
    private func configureSpikeBallAnimation(){
        
        guard let texture1 = textureAtlasManager.getTextureAtlas(atlasType: .SpikeBall)?.textureNamed("spikeBall1"), let texture2 = textureAtlasManager.getTextureAtlas(atlasType: .SpikeBall)?.textureNamed("spikeBall_2") else { return }
        
        spikeballAnimation =  SKAction.animate(with: [
            texture1,
            texture2
            ], timePerFrame: 0.25)
        
    }
    
    private func configureEnemySunAnimation(){
        
        guard let texture1 = textureAtlasManager.getTextureAtlas(atlasType: .EnemySun)?.textureNamed("sun1"), let texture2 = textureAtlasManager.getTextureAtlas(atlasType: .EnemySun)?.textureNamed("sun2") else { return }
        
        
        enemySunAnimation = SKAction.animate(with: [
            texture1,
            texture2
            
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
        
         guard let texture1 = textureAtlasManager.getTextureAtlas(atlasType: .GoldCoin)?.textureNamed("gold_1"), let texture2 = textureAtlasManager.getTextureAtlas(atlasType: .GoldCoin)?.textureNamed("gold_2"), let texture3 = textureAtlasManager.getTextureAtlas(atlasType: .GoldCoin)?.textureNamed("gold_3") else { return }
        
        let turnAction = SKAction.animate(with: [
            texture1,
            texture2,
            texture3
            ], timePerFrame: 0.40)
        
        let reverseTurnAction = turnAction.reversed()
        
        let defaultAction = SKAction.sequence([
            turnAction,
            reverseTurnAction
            ])
        
        goldCoinAnimation = defaultAction
    }
    
    private func configureSilverCoinAnimation(){
        
        guard let texture1 = textureAtlasManager.getTextureAtlas(atlasType: .SilverCoin)?.textureNamed("silver_1"), let texture2 = textureAtlasManager.getTextureAtlas(atlasType: .SilverCoin)?.textureNamed("silver_2"), let texture3 = textureAtlasManager.getTextureAtlas(atlasType: .SilverCoin)?.textureNamed("silver_3") else { return }
        

        
        let turnAction =  SKAction.animate(with: [
            texture1,
            texture2,
            texture3
            ], timePerFrame: 0.40)
        
        let reverseTurnAction = turnAction.reversed()
        
        let defaultAction = SKAction.sequence([
            turnAction,
            reverseTurnAction
            ])
        
        silverCoinAnimation = defaultAction
    }
    
    private func configureBronzeCoinAnimation(){
        
         guard let texture1 = textureAtlasManager.getTextureAtlas(atlasType: .BronzeCoin)?.textureNamed("bronze_1"), let texture2 = textureAtlasManager.getTextureAtlas(atlasType: .BronzeCoin)?.textureNamed("bronze_2"), let texture3 = textureAtlasManager.getTextureAtlas(atlasType: .BronzeCoin)?.textureNamed("bronze_3") else { return }
        
        let turnAction = SKAction.animate(with: [
            texture1,
            texture2,
            texture3
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
