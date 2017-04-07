//
//  RandomPointGenerator.swift
//  FantasticFurryDrifters
//
//  Created by Aleksander Makedonski on 4/7/17.
//  Copyright © 2017 AlexMakedonski. All rights reserved.
//

import Foundation
import GameplayKit


class RandomGenerator{
    
    static func getRandomScreenPoint() -> CGPoint{
        
        let minHorizontal = -Int(ScreenSizeConstants.HalfScreenWidth)
        let maxHorizontal = Int(ScreenSizeConstants.HalfScreenWidth)
        
        let minVertical = -Int(ScreenSizeConstants.HalfScreenHeight)
        let maxVertical = Int(ScreenSizeConstants.HalfScreenHeight)
        
        let rDistHorizontal = GKRandomDistribution(lowestValue: minHorizontal, highestValue: maxHorizontal)
        let rDistVertical = GKRandomDistribution(lowestValue: minVertical, highestValue: maxHorizontal)
        
        
        let randomXPos = rDistHorizontal.nextInt()
        let randomYPos = rDistVertical.nextInt()
        
        return CGPoint(x: randomXPos, y: randomYPos)
        
    }
    
    static func getRandomGaussianScalingFactor(meanScalingFactor: Float, scalingFactorDeviation: Float) -> Float{
       
        let randomSource = GKLinearCongruentialRandomSource()
        let rDist = GKGaussianDistribution(randomSource: randomSource, mean: meanScalingFactor, deviation: scalingFactorDeviation)
        
        return rDist.nextUniform()
    }
    
}
