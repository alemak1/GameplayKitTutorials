//
//  EnemyAgentScene.swift
//  FantasticFurryDrifters
//
//  Created by Aleksander Makedonski on 4/7/17.
//  Copyright © 2017 AlexMakedonski. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit
import CoreMotion

class EnemyAgentScene: SKScene{
    
    var lastUpdateTime: TimeInterval = 0.00
    
    var entitiesManager: EntityManager!
    var player: GKPlayer!
    var motionManager: CMMotionManager = CMMotionManager()
    
    override func didMove(to view: SKView) {
        entitiesManager = EntityManager(scene: self)
        
        let initialPos = CGPoint.zero
        player = GKPlayer(image: #imageLiteral(resourceName: "SOrabbit"), scalingFactor: 0.40, motionManager: self.motionManager, position: nil, size: nil)
        entitiesManager.add(player)
        
        
        let spikeBall = GKSpikeBall(scalingFactor: 0.50, position: nil)
        entitiesManager.add(spikeBall)
        
        
    }
    
    override func sceneDidLoad() {
        motionManager.startDeviceMotionUpdates()
        motionManager.deviceMotionUpdateInterval = 0.50
        
        //Perform basic scene configuration
        backgroundColor = ColorGenerator.getColor(colorType: .SkyBlue)
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
    }
    
    //MARK: ********* Game Loop functions
    
    override func update(_ currentTime: TimeInterval) {
        // Initialize _lastUpdateTime if it has not already been
        if (self.lastUpdateTime == 0) {
            self.lastUpdateTime = currentTime
        }
        
        let dt = currentTime - lastUpdateTime
        
        player.component(ofType: GKMotionResponderComponent.self)?.update(deltaTime: dt)
        
        lastUpdateTime = currentTime
    }
    
    override func didSimulatePhysics() {
        
    }
    
    override func didEvaluateActions() {
        
    }
    
    //MARK: ********* User Touch Handlers 
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
}
