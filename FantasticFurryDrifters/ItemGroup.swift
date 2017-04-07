//
//  ItemGroup.swift
//  FantasticFurryDrifters
//
//  Created by Aleksander Makedonski on 4/7/17.
//  Copyright © 2017 AlexMakedonski. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

class ItemGroup{
    static func generateBasicRandomCoin(forParentNode parentNode: SKNode, number: Int, ofType coinType: Coin.CoinType){
        
        for _ in 0..<number{
            
            let randomPoint = RandomGenerator.getRandomScreenPoint()
            
            let newCoin = Coin(position: randomPoint, size: nil, scalingFactor: 0.40, coinType: coinType)
            
            parentNode.addChild(newCoin)
        }
    }
    
    static func generateBasicRandomCarrot(forParentNode parentNode: SKNode, number: Int, ofType carrotType: Carrot.CarrotType){
        
        for _ in 0..<number{
            
            let randomPoint = RandomGenerator.getRandomScreenPoint()
            
            let newCarrot = Carrot(position: randomPoint, size: nil, scalingFactor: 0.40, carrotType: carrotType)
            
            parentNode.addChild(newCarrot)
        }
    }
}
