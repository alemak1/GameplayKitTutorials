//
//  GameScene.swift
//  FantasticFurryDrifters
//
//  Created by Aleksander Makedonski on 4/6/17.
//  Copyright © 2017 AlexMakedonski. All rights reserved.
//

import SpriteKit
import GameplayKit
import CoreMotion

class GameScene: SKScene {
    
    var lastUpdateTime: Double = 0
    
    let motionManager = CMMotionManager()
    var mainGyroData: CMGyroData?
    var lastError: CMError?
    
    
    var player: Player!
    
    override func sceneDidLoad() {
        
        //motionManager.gyroUpdateInterval = 0.50
        //motionManager.startGyroUpdates()
        
        motionManager.startDeviceMotionUpdates()
        motionManager.deviceMotionUpdateInterval = 0.50
        
//        motionManager.startGyroUpdates(to: mainQueue, withHandler: {
//        
//            (gyroData: CMGyroData?, error: Error?) in
//            
//            if(error != nil){
//                self.mainGyroData = gyroData
//            }
//        
//        })
        
        
        backgroundColor = ColorGenerator.getColor(colorType: .SkyBlue)
        
        self.lastUpdateTime = 0
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
       
        
       
        player = Player(scalingFactor: 0.10)
        self.addChild(player)
        
        
        
        
        EnemyGroup.generateBasicRandomSpikeBall(forParentNode: self, number: 4)
        
        let spikeman1 = Spikeman(edgePosition: nil, size: nil, scalingFactor: 0.40, edgeLocation: .Bottom)
        spikeman1.addEdgeWalkAnimation()
        
        let spikeman2 = Spikeman(edgePosition: nil, size: nil, scalingFactor: 0.40, edgeLocation: .Left)
        spikeman2.addEdgeWalkAnimation()
        
        let spikeman3 = Spikeman(edgePosition: nil, size: nil, scalingFactor: 0.40, edgeLocation: .Right)
        spikeman3.addEdgeWalkAnimation()
        
        let spikeman4 = Spikeman(edgePosition: nil, size: nil, scalingFactor: 0.40, edgeLocation: .Top)
        spikeman4.addEdgeWalkAnimation()
        
        self.addChild(spikeman1)
        self.addChild(spikeman2)
        self.addChild(spikeman3)
        self.addChild(spikeman4)
        
       // EnemyGroup.generateBasicRandomEnemySun(forParentNode: self, number: 2)
       // EnemyGroup.generateBasicRandomEnemyCloud(forParentNode: self, number: 3)
        
       // ItemGroup.generateBasicRandomCoin(forParentNode: self, number: 3, ofType: .Silver)
       // ItemGroup.generateBasicRandomCoin(forParentNode: self, number: 1, ofType: .Gold)
        //ItemGroup.generateBasicRandomCoin(forParentNode: self, number: 2, ofType: .Bronze)
        ItemGroup.generateBasicRandomCarrot(forParentNode: self, number: 3, ofType: .Gold)
        ItemGroup.generateBasicRandomCarrot(forParentNode: self, number: 2, ofType: .Regular)
        
        //Configure bottom edge
       // let bottomEdge = SpikeEdge(edgeLocation: .Bottom)
       // self.addChild(bottomEdge)
        
        //Configure left edge
        //let leftEdge = SpikeEdge(edgeLocation: .LeftSide)
        //self.addChild(leftEdge)
        
        //Configure top edge
        //let topEdge = SpikeEdge(edgeLocation: .Top)
        //self.addChild(topEdge)
        
        //Configure right edge 
       // let rightEdge = SpikeEdge(edgeLocation: .RightSide)
       // self.addChild(rightEdge)
        
        //Called during pause or after end of game
        //motionManager.stopDeviceMotionUpdates()
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
        
    }
    
    func touchMoved(toPoint pos : CGPoint) {
       
    }
    
    func touchUp(atPoint pos : CGPoint) {
       
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    
    override func didSimulatePhysics() {
        if let deviceMotion = self.motionManager.deviceMotion{
            player.respondToDeviceMotion(deviceMotion: deviceMotion)
           
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        // Initialize _lastUpdateTime if it has not already been
        if (self.lastUpdateTime == 0) {
            self.lastUpdateTime = currentTime
        }
        
        // Calculate time since last update
        let dt = currentTime - self.lastUpdateTime
        
       
        /**
        if let gyroData = motionManager.gyroData{
            let verticalRotationRate = -gyroData.rotationRate.x
            let horizontalRotationRate = gyroData.rotationRate.y
            
            let appliedVector = CGVector(dx: horizontalRotationRate, dy: verticalRotationRate)
            panda.physicsBody?.applyForce(appliedVector)
            
        } **/
        
        
        
        self.lastUpdateTime = currentTime
    }
}
