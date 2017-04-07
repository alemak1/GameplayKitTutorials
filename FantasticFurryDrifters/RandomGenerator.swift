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
    
    enum ScreenEdge{
        case Top, Left, Right, Bottom
    }
    
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
    
    static func getRandomEdgePointFor(screenEdge: ScreenEdge) -> CGPoint{
        
        let randomSource = GKLinearCongruentialRandomSource()
        
        let minHorizontal = -Int(ScreenSizeConstants.HalfScreenWidth)
        let maxHorizontal = Int(ScreenSizeConstants.HalfScreenWidth)
        
        let minVertical = -Int(ScreenSizeConstants.HalfScreenHeight)
        let maxVertical = Int(ScreenSizeConstants.HalfScreenHeight)
        
        let horizontalDist = GKShuffledDistribution(randomSource: randomSource, lowestValue: minHorizontal, highestValue: maxHorizontal)
        
        let verticalDist = GKShuffledDistribution(randomSource: randomSource, lowestValue: minVertical, highestValue: maxVertical)
        
        var randomEdgePoint: CGPoint
        
        switch(screenEdge){
        case .Bottom:
            randomEdgePoint = CGPoint(x: horizontalDist.nextInt(), y: -Int(ScreenSizeConstants.HalfScreenHeight))
            break
        case .Left:
            randomEdgePoint = CGPoint(x: -Int(ScreenSizeConstants.HalfScreenWidth), y: verticalDist.nextInt())
            break
        case .Right:
            randomEdgePoint = CGPoint(x: Int(ScreenSizeConstants.HalfScreenWidth), y: verticalDist.nextInt())
            break
        case .Top:
            randomEdgePoint = CGPoint(x: horizontalDist.nextInt(), y: Int(ScreenSizeConstants.HalfScreenHeight))
            break
        }
        
        return randomEdgePoint
        
    }
    
}
