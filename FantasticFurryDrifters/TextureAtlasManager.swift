//
//  TextureAtlasManager.swift
//  FantasticFurryDrifters
//
//  Created by Aleksander Makedonski on 4/9/17.
//  Copyright © 2017 AlexMakedonski. All rights reserved.
//

import Foundation
import SpriteKit


class TextureAtlasManager{
    
    //MARK: ******** Nested Enum for TextureAtlas types
    enum TextureAtlasType{
        case Aliens
        case Blade
        case BronzeCoin
        case Debris
        case EnemyCloud
        case EnemySun
        case ExplosiveElements
        case Flags
        case Gems
        case GoldCoin
        case HUD
        case Items
        case Keys
        case OtherEnemies
        case RoundUnoutlinedAnimals
        case SilverCoin
        case SpikeBall
        case SpikeMan
        case Spikes
        case Spring
        case SquareOutlinedAnimals
        case Stars
        case Tiles
        case UIElements
    }
    
    //MARK: ********** Singleton
    
    static let sharedInstance = TextureAtlasManager()
    
    //MARK: ********* Stored Texture Atlas References
    
    var goldCoinAtlas: SKTextureAtlas?
    var silverCoinAtlas: SKTextureAtlas?
    var bronzeCoinAtlas: SKTextureAtlas?
    var itemsAtlas: SKTextureAtlas?
    var hudAtlas: SKTextureAtlas?
    var enemySunAtlas: SKTextureAtlas?
    var enemyCloudAtlas: SKTextureAtlas?
    var spikemanAtlas: SKTextureAtlas?
    var spikeballAtlas: SKTextureAtlas?
    var squareOutlineAnimalsAtlas: SKTextureAtlas?
    var roundUnoutlinedAnimalsAtlas: SKTextureAtlas?
    var userInterfaceElementsAtlas: SKTextureAtlas?
    var spikesAtlas: SKTextureAtlas?
    var debrisAtlas: SKTextureAtlas?
    var explosiveElementsAtlas: SKTextureAtlas?
    var flagsAtlas: SKTextureAtlas?
    var aliensAtlas: SKTextureAtlas?
    var bladeAtlas: SKTextureAtlas?
    var gemsAtlas: SKTextureAtlas?
    var keysAtlas: SKTextureAtlas?
    var otherEnemiesAtlas: SKTextureAtlas?
    var starsAtlas: SKTextureAtlas?
    var tilesAtlas: SKTextureAtlas?
    var springAtlas: SKTextureAtlas?
    
    private init(){
        configureTextureAtlases()
    }
    
    
    //MARK: ********* GETTER METHOD FOR TEXTURE ATLASES
    func getTextureAtlas(atlasType: TextureAtlasType) -> SKTextureAtlas?{
        switch(atlasType){
        case .Aliens:
            return aliensAtlas
        case .Blade:
            return bladeAtlas
        case .BronzeCoin:
            return bronzeCoinAtlas
        case .Debris:
            return debrisAtlas
        case .EnemyCloud:
            return enemyCloudAtlas
        case .EnemySun:
            return enemySunAtlas
        case .ExplosiveElements:
            return explosiveElementsAtlas
        case .Flags:
            return flagsAtlas
        case .Gems:
            return gemsAtlas
        case .GoldCoin:
            return goldCoinAtlas
        case .HUD:
            return hudAtlas
        case .Items:
            return itemsAtlas
        case .Keys:
            return keysAtlas
        case .OtherEnemies:
            return otherEnemiesAtlas
        case .RoundUnoutlinedAnimals:
            return roundUnoutlinedAnimalsAtlas
        case .SilverCoin:
            return silverCoinAtlas
        case .SpikeBall:
            return spikeballAtlas
        case .SpikeMan:
            return spikemanAtlas
        case .Spikes:
            return spikesAtlas
        case .Spring:
            return springAtlas
        case .SquareOutlinedAnimals:
            return squareOutlineAnimalsAtlas
        case .Stars:
            return starsAtlas
        case .Tiles:
            return tilesAtlas
        case .UIElements:
            return userInterfaceElementsAtlas
        }
    }
    
    private func configureTextureAtlases(){
        
        aliensAtlas = SKTextureAtlas(named: "Aliens.atlas")
        bladeAtlas = SKTextureAtlas(named: "Blade.atlas")
        bronzeCoinAtlas = SKTextureAtlas(named: "BronzeCoin.atlas")
        debrisAtlas = SKTextureAtlas(named: "Debris.atlas")
        enemyCloudAtlas = SKTextureAtlas(named: "EnemyCloud.atlas")
        enemySunAtlas = SKTextureAtlas(named: "EnemySun.atlas")
        explosiveElementsAtlas = SKTextureAtlas(named: "ExplosiveElements.atlas")
        flagsAtlas = SKTextureAtlas(named: "Flags.atls")
        gemsAtlas = SKTextureAtlas(named: "Gems.atlas")
        goldCoinAtlas = SKTextureAtlas(named: "GoldCoin.atlas")
        hudAtlas = SKTextureAtlas(named: "HUD.atlas")
        itemsAtlas = SKTextureAtlas(named: "Items.atlas")
        keysAtlas = SKTextureAtlas(named: "Keys.atlas")
        otherEnemiesAtlas = SKTextureAtlas(named: "OtherEnemies.atlas")
        roundUnoutlinedAnimalsAtlas = SKTextureAtlas(named: "RoundUnoutlinedAnimals.atlas")
        silverCoinAtlas = SKTextureAtlas(named: "SilverCoin.atlas")
        spikeballAtlas = SKTextureAtlas(named: "SpikeBall.atlas")
        spikemanAtlas = SKTextureAtlas(named: "SpikeMan.atlas")
        spikesAtlas = SKTextureAtlas(named: "Spikes.atlas")
        springAtlas = SKTextureAtlas(named: "Spring.atlas")
        squareOutlineAnimalsAtlas = SKTextureAtlas(named: "SquareOutlinedAnimals.atlas")
        starsAtlas = SKTextureAtlas(named: "Stars.atlas")
        tilesAtlas = SKTextureAtlas(named: "Tiles.atlas")
        userInterfaceElementsAtlas = SKTextureAtlas(named: "UIElements.atlas")
    }
    
}
