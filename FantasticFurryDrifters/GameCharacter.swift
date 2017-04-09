//
//  GameCharacter.swift
//  FantasticFurryDrifters
//
//  Created by Aleksander Makedonski on 4/8/17.
//  Copyright © 2017 AlexMakedonski. All rights reserved.
//

import Foundation
import SpriteKit
import UIKit

enum GameCharacter{
    case Spikeman
    case Spikeball
    case EnemySun
    case EnemyCloud
    case GoldCoin
    case SilverCoin
    case BronzeCoin
    case EdgeSpikes
    case JetPack
    case BubbleCover
    case OrangePortal
    case YellowPortal
    case RegularCarrot
    case GoldCarrot
    
    
    var title: String?{
        get{
            switch(self){
            case .GoldCoin:
                return "Gold Coin"
            case .SilverCoin:
                return "Silver Coin"
            case .BronzeCoin:
                return "Bronze Coin"
            case .EnemyCloud:
                return "Killer Cloud"
            case .EnemySun:
                return "Savage Sun"
            case .Spikeman:
                return "Spikeman"
            case .Spikeball:
                return "Spikeball"
            case .EdgeSpikes:
                return "Edge Spikes"
            case .JetPack:
                return "JetPack"
            case .BubbleCover:
                return "Bubble Cover"
            case .OrangePortal:
                return "Orange Portal"
            case .YellowPortal:
                return "Yellow Portal"
            case .RegularCarrot:
                return "Regular Carrot"
            case .GoldCarrot:
                return "Gold Carrot"
            }
        }
    }
    
    var description: String?{
        get{
            switch(self){
                case .Spikeman:
                    return "Spikeman runs along the edges of the screen, waiting for Riddle Rabbit to get stuck on his deadly spike.  Once impaled on Spikeman's spiky head, the player is damaged and cannot move any further. Try as much as possible to avoid this nasty critter!"
                case .Spikeball:
                    return "Spikeball is constantly spinning in the air, sometimes moving back and forth, sometimes moving in random directions, and sometimes even trying to chase Riddle Rabbit"
                case .EdgeSpikes:
                    return "Edge spikes remain static along the edges, unlike Spikeman. They cause player damage if hit by the player but will not impale the player."
                case .GoldCoin:
                    return "A gold coin is worth 5 points."
                case .SilverCoin:
                    return "A silver coin is worth 3 points"
                case .BronzeCoin:
                    return "A bronze coin is worth 1 point"
                case .EnemySun:
                    return "Savage Sun just can't wait to scorch and burn Riddle Rabbit and keep him from collecting coins and carrots."
                case .EnemyCloud:
                    return "Killer clouds are not like regular backgrounds clouds and can cause damage to Riddle Rabbit.  Try to avoid these nasty clouds at all costs."
                case .JetPack:
                    return "JetPacks allow the player to use touch control on Riddle Rabbit.  When a jetpack is obtained, instead of having to tilt the screen back and forth, just touch down on the riddle rabbit and move him freely around the screen."
                case .BubbleCover:
                    return "Getting a bubble provides Riddle Rabbit with temporary protection against surrounding enemies.  But beware: every bubble will eventually burst!"
                case .YellowPortal:
                    return "Yellow portal transport Riddle Rabbit closer to coins"
                case .OrangePortal:
                    return "Orange portals transport Riddle Rabbit closer to carrots"
                case .GoldCarrot:
                    return "A regular carrot provides an extra life."
                case .RegularCarrot:
                    return "A gold carrot provides full life restoration. These are often heavily guarded by enemies"
                
            }
        }
    }
    
    var image: UIImage?{
        get{
            switch(self){
            case .GoldCoin:
                return #imageLiteral(resourceName: "gold_1")
            case .SilverCoin:
                return #imageLiteral(resourceName: "silver_1")
            case .BronzeCoin:
                return #imageLiteral(resourceName: "bronze_1")
            case .EnemyCloud:
                return #imageLiteral(resourceName: "enemyCloud")
            case .EnemySun:
                return #imageLiteral(resourceName: "sun1")
            case .Spikeman:
                return #imageLiteral(resourceName: "spikeMan_stand")
            case .Spikeball:
                return #imageLiteral(resourceName: "spikeBall1")
            case .EdgeSpikes:
                return #imageLiteral(resourceName: "spike_top")
            case .JetPack:
                return #imageLiteral(resourceName: "jetpack")
            case .OrangePortal:
                return #imageLiteral(resourceName: "portal_orange")
            case .YellowPortal:
                return #imageLiteral(resourceName: "portal_yellow")
            case .BubbleCover:
                return #imageLiteral(resourceName: "bubble")
            case .RegularCarrot:
                return #imageLiteral(resourceName: "carrot")
            case .GoldCarrot:
                return #imageLiteral(resourceName: "carrot_gold")
            }
            
        }
    }
    
    
}


extension GameCharacter{
    
    var basicTexture: SKTexture?{
        get{
            switch(self){
            case .Spikeman:
                return TextureAtlasManager.sharedInstance.getTextureAtlas(atlasType: .SpikeMan)?.textureNamed("spikeMan_jump")
            case .Spikeball:
                return TextureAtlasManager.sharedInstance.getTextureAtlas(atlasType: .SpikeBall)?.textureNamed("spikeBall1")
            case .EnemySun:
                return TextureAtlasManager.sharedInstance.getTextureAtlas(atlasType: .EnemySun)?.textureNamed("sun1")
            case .EnemyCloud:
                return TextureAtlasManager.sharedInstance.getTextureAtlas(atlasType: .EnemyCloud)?.textureNamed("enemyCloud")
            case .GoldCoin:
                return TextureAtlasManager.sharedInstance.getTextureAtlas(atlasType: .GoldCoin)?.textureNamed("gold_1")
            case .SilverCoin:
                return TextureAtlasManager.sharedInstance.getTextureAtlas(atlasType: .SilverCoin)?.textureNamed("silver_1")
            case .BronzeCoin:
                return TextureAtlasManager.sharedInstance.getTextureAtlas(atlasType: .BronzeCoin)?.textureNamed("bronze_1")
            case .GoldCarrot:
                return TextureAtlasManager.sharedInstance.getTextureAtlas(atlasType: .Items)?.textureNamed("carrot_gold")
            case .RegularCarrot:
                return TextureAtlasManager.sharedInstance.getTextureAtlas(atlasType: .Items)?.textureNamed("carrot")
            case .JetPack:
                return TextureAtlasManager.sharedInstance.getTextureAtlas(atlasType: .Items)?.textureNamed("jetpack")
            case .OrangePortal:
                return TextureAtlasManager.sharedInstance.getTextureAtlas(atlasType: .Items)?.textureNamed("portal_orange")
            case .YellowPortal:
                return TextureAtlasManager.sharedInstance.getTextureAtlas(atlasType: .Items)?.textureNamed("portal_yellow")
            case .BubbleCover:
                return TextureAtlasManager.sharedInstance.getTextureAtlas(atlasType: .Items)?.textureNamed("bubble")
            case .EdgeSpikes:
                 return TextureAtlasManager.sharedInstance.getTextureAtlas(atlasType: .Spikes)?.textureNamed("spikes_top")
            default:
                return TextureAtlasManager.sharedInstance.getTextureAtlas(atlasType: .Spikes)?.textureNamed("spikes_top")

                
            }

        }
    }
    
    var basicAnimation: SKAction?{
        get{
            switch(self){
            case .Spikeman:
                return AnimationFactory.sharedInstance.getSpikemanDefaultAnimation()
            case .Spikeball:
                return AnimationFactory.sharedInstance.getSpikeballDefaultAnimation()
            case .EnemySun:
                return AnimationFactory.sharedInstance.getEnemySunDefaultAnimation()
            case .EnemyCloud:
                return AnimationFactory.sharedInstance.getEnemyCloudDefaultAnimation()
            case .GoldCoin:
                return AnimationFactory.sharedInstance.getGoldCoinDefaultAnimation()
            case .SilverCoin:
                return AnimationFactory.sharedInstance.getSilverCoinDefaultAnimation()
            case .BronzeCoin:
                return AnimationFactory.sharedInstance.getBronzeCoinDefaultAnimation()
            case .GoldCarrot:
                return AnimationFactory.sharedInstance.getGoldCarrotDefaultAnimation()
            case .RegularCarrot:
                return AnimationFactory.sharedInstance.getRegularCarrotDefaultAnimation()
            default:
                return SKAction()

            }
            
        }
    }
    
}

extension GameCharacter{
    
    static let profilesArray = [
        
        //MARK: ****** Enemy Profiles
        
        [GameCharacter.Spikeman,
         GameCharacter.Spikeball,
         GameCharacter.EnemySun,
         GameCharacter.EnemyCloud,
         GameCharacter.EdgeSpikes],
        
        //MARK: ********* Game Item Profiles
        
        [ GameCharacter.JetPack,
          GameCharacter.BubbleCover,
          GameCharacter.OrangePortal,
          GameCharacter.YellowPortal],
        
        //MARK: ************ Carrot Item Profiles
        
        [GameCharacter.RegularCarrot,
         GameCharacter.GoldCarrot],
        
        //MARK: ************ Coin Item Profiles
        [GameCharacter.GoldCoin,
         GameCharacter.SilverCoin,
         GameCharacter.BronzeCoin ]
        
    ]
}
