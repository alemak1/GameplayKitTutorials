//
//  SpikeEdge.swift
//  FantasticFurryDrifters
//
//  Created by Aleksander Makedonski on 4/6/17.
//  Copyright © 2017 AlexMakedonski. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

class SpikeEdge: SKSpriteNode{
    
    
    enum EdgeLocation{
        case Top, Bottom, LeftSide, RightSide
    }
    
    var edgeLocation: EdgeLocation? = .Bottom
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: .clear, size: size)
        
       
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
      

    }
    
    convenience init(edgeLocation: EdgeLocation) {
        
        let mainTexture = SKTexture(image: #imageLiteral(resourceName: "spike_top"))
        let mainSize = mainTexture.size()
        
        
        self.init(texture: mainTexture, color: .clear, size: mainSize)
        
        self.edgeLocation = edgeLocation
        
    
        configureAnchorPoint(edgeLocation: edgeLocation)
        configureTextureRotation(edgeLocation: edgeLocation)
        configurePosition(edgeLocation: edgeLocation)
        configurePhysicsProperties()
        
        
        
        self.xScale *= 0.8
        self.yScale *= 0.8
    }
    
    
    //MARK: *********** Helper Functions for Initializing Edge
    func configurePhysicsProperties(){
        
        if let physicsBodyTexture = self.texture{
            let size = physicsBodyTexture.size()
            self.physicsBody = SKPhysicsBody(texture: physicsBodyTexture, size: size)
            self.physicsBody?.affectedByGravity = false
            self.physicsBody?.isDynamic = false
            self.physicsBody?.allowsRotation = false

        }
    
    }
    
    func configureTextureRotation(edgeLocation: EdgeLocation){
        
        var rotationAngle: Double = 0.00
        
        switch(edgeLocation){
            case .Bottom:
                break
            case .LeftSide:
                rotationAngle = -M_PI/2
                break
            case .RightSide:
                rotationAngle = M_PI/2
                break
            case .Top:
                rotationAngle = M_PI/2
                break
        }
        
        let rotationAction = SKAction.rotate(byAngle: CGFloat(rotationAngle), duration: 0.00)
        self.run(rotationAction)
    }
    
    func configureAnchorPoint(edgeLocation: EdgeLocation){
        switch edgeLocation {
        case .Bottom:
            self.anchorPoint = CGPoint(x: 0.5, y: 0.0)
            break
        case .LeftSide:
            self.anchorPoint = CGPoint(x: 0.0, y: 0.5)
            break
        case .RightSide:
            self.anchorPoint = CGPoint(x: 1.0, y: 0.5)
            break
        case .Top:
            self.anchorPoint = CGPoint(x: 0.5, y: 1.0)
            break
        }
    }
    
    func configurePosition(edgeLocation: EdgeLocation){
        
        switch(edgeLocation){
            case .Bottom:
                configureBottomEdgePosition()
                break
            case .Top:
                configureTopEdgePosition()
                break
            case .LeftSide:
                configureLeftEdgePosition()
                break
            case .RightSide:
                configureRightEdgePosition()
                break
        }
        
        
   
    }
    
    
    //MARK: ******** Helper functions for configuring edge position
    
    private func configureBottomEdgePosition(){
        let minValue = -Int(ScreenSizeConstants.HalfScreenWidth)
        let maxValue = Int(ScreenSizeConstants.HalfScreenWidth)
        
        let randomDist = GKRandomDistribution(lowestValue: minValue, highestValue: maxValue)
        
        let xPos = randomDist.nextInt()
        let yPos = -Int(ScreenSizeConstants.HalfScreenHeight) - 2
        
        self.position = CGPoint(x: xPos, y: yPos)
    }
    
    private func configureLeftEdgePosition(){
        let minValue = -Int(ScreenSizeConstants.HalfScreenHeight)
        let maxValue = Int(ScreenSizeConstants.HalfScreenHeight)
        
        let randomDist = GKRandomDistribution(lowestValue: minValue, highestValue: maxValue)
        
        let xPos = -Int(ScreenSizeConstants.HalfScreenWidth) - 2
        let yPos = randomDist.nextInt()
        
        self.position = CGPoint(x: xPos, y: yPos)
    }
    
    private func configureTopEdgePosition(){
        let minValue = -Int(ScreenSizeConstants.HalfScreenWidth)
        let maxValue = Int(ScreenSizeConstants.HalfScreenWidth)
        
        let randomDist = GKRandomDistribution(lowestValue: minValue, highestValue: maxValue)
        
        let xPos = randomDist.nextInt()
        let yPos = Int(ScreenSizeConstants.HalfScreenHeight) + 2
        
        self.position = CGPoint(x: xPos, y: yPos)
    }
    
    private func configureRightEdgePosition(){
        
        let minValue = -Int(ScreenSizeConstants.HalfScreenHeight)
        let maxValue = Int(ScreenSizeConstants.HalfScreenHeight)
        
        let randomDist = GKRandomDistribution(lowestValue: minValue, highestValue: maxValue)
        
        let xPos = Int(ScreenSizeConstants.HalfScreenWidth)
        let yPos = randomDist.nextInt()
        
        self.position = CGPoint(x: xPos, y: yPos)
    }
    
}
