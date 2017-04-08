//
//  CharacterProfileSet.swift
//  FantasticFurryDrifters
//
//  Created by Aleksander Makedonski on 4/8/17.
//  Copyright © 2017 AlexMakedonski. All rights reserved.
//

import Foundation
import UIKit


struct CharacterProfile{
    
    var title: String
    var image: UIImage
    var description: String
    
    
}

class CharacterProfileSet{

    static let profilesArray = [
        
        
        //MARK: ****** Enemy Profiles
        
        [   CharacterProfile(title: "Spikeman", image: #imageLiteral(resourceName: "spikeMan_jump"), description: "Spikeman runs along the edges of the screen, waiting for Riddle Rabbit stuck on his deadly spike.  Once impaled on the Spike, the player is damaged and cannot move any further. Try as much as possible to avoid"),
            
            CharacterProfile(title: "SpikeBall", image: #imageLiteral(resourceName: "spikeBall1"), description: "Spikeball is constantly spinning in the air, sometimes moving back and forth, sometimes moving in random directions, and sometimes even trying to chase Riddle Rabbit"),
            
            CharacterProfile(title: "Savage Sun", image: #imageLiteral(resourceName: "sun1"), description: "Savage Sun just can't wait to scorch and burn Riddle Rabbit and keep him from collecting coins and carrots."),
            
            CharacterProfile(title: "Edge Spikes", image: #imageLiteral(resourceName: "spike_top"), description: "Edge spikes remain static along the edges, unlike Spikeman. They cause player damage if hit by the player but will not impale the player."),
            
            CharacterProfile(title: "Killer Clouds", image: #imageLiteral(resourceName: "enemyCloud"), description: "Killer clouds are not like ordinary background clouds.  They can do damage to Riddle Rabbit and so must be avoided")
        ],
        
        //MARK: ********* Game Item Profiles
        
        [   CharacterProfile(title: "JetPack", image: #imageLiteral(resourceName: "jetpack"), description: "JetPacks allow the player to use touch control on Riddle Rabbit.  When a jetpack is obtained, instead of having to tilt the screen back and forth, just touch down on the riddle rabbit and move him freely around the screen."),
            
            
            CharacterProfile(title: "Regular Carrot", image: #imageLiteral(resourceName: "carrot"), description: "A regular carrot provides an extra life."),
            
            CharacterProfile(title: "Golden Carrot", image: #imageLiteral(resourceName: "carrot_gold"), description: "A gold carrot provides full life restoration. These are often heavily guarded by enemies"),
            
            CharacterProfile(title: "Bubble Cover", image: #imageLiteral(resourceName: "bubble"), description: "Getting a bubble provides Riddle Rabbit with temporary protection against surrounding enemies.  But beware: every bubble will eventually burst!"),
            
            CharacterProfile(title: "Orange Portal", image: #imageLiteral(resourceName: "portal_orange"), description: "Orange portals transport Riddle Rabbit closer to carrots"),
            
            CharacterProfile(title: "Yellow Portal", image: #imageLiteral(resourceName: "portal_yellow"), description: "Yellow portal transport Riddle Rabbit closer to coins"),
            
            CharacterProfile(title: "Gold Coin", image: #imageLiteral(resourceName: "coin_gold"), description: "A gold coin is worth 5 points."),
            
            CharacterProfile(title: "Silver Coin", image: #imageLiteral(resourceName: "coin_silver"), description: "A silver coin is worth 3 points"),
            
            CharacterProfile(title: "Bronze Coin", image: #imageLiteral(resourceName: "coin_bronze"), description: "A bronze coin is worth 1 point.")
        
        ],
        
        [
        
        ],
        
        [
        
        ],
        
    ]
    
    
    
    
}
