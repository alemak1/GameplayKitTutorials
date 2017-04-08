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
    var motionManager: CMMotionManager = CMMotionManager()
    
    
    //Add game characters (players, enemies, items, etc.) to the world
    var world: SKNode?
    
    //Add UI elements to the overlay
    var overlay: SKNode?
    
    
    lazy var pinchRecognizer: UIPinchGestureRecognizer = {
        
        let pinchRecognizer = UIPinchGestureRecognizer(target: self, action: #selector(EnemyAgentScene.adjustCameraScale(sender:)))
        
        return pinchRecognizer
    }()
    
 
    
    override func didMove(to view: SKView) {
        
        //Add pinch gesture recognizer for expanding and contracting view
        self.view?.addGestureRecognizer(pinchRecognizer)
        
        world = SKNode()
        world?.zPosition = 15
        world?.name = "world"
        self.addChild(world!)

        self.camera = SKCameraNode()
        self.camera?.isUserInteractionEnabled = true
        
        overlay = SKNode()
        overlay?.zPosition = 30
        overlay?.name = "overlay"
        self.addChild(overlay!)
        
        
        
        
        entitiesManager = EntityManager(scene: self)
        
        let initialPos = CGPoint.zero
        let player = GKPlayer(image: #imageLiteral(resourceName: "SOrabbit"), scalingFactor: 0.40, motionManager: self.motionManager, position: nil, size: nil)
        entitiesManager.add(player)
        
       //let userInterfaceManager = GKUserInterfaceManager(managedScene: self, enableCamera: true)
        //entitiesManager.add(userInterfaceManager)
    
        
        let spikeBall = GKSpikeBall(scalingFactor: 0.20, position: nil)
        entitiesManager.add(spikeBall)
        
        let enemySun = GKEnemySun(scalingFactor: 0.30, position: nil)
        entitiesManager.add(enemySun)
        
        let spikemanLeft1 = GKSpikemanLeft(scalingFactor: 0.20, position: nil, movementLowerBound: -20, movementUpperBound: 50)
        entitiesManager.add(spikemanLeft1)
        
        let spikemanRight1 = GKSpikemanRight(scalingFactor: 0.20, position: nil, movementLowerBound: -100, movementUpperBound: 200)
        entitiesManager.add(spikemanRight1)
        
        let spikemanBottom1 = GKSpikemanBottom(scalingFactor: 0.40, position: nil, movementLowerBound: nil, movementUpperBound: nil)
        entitiesManager.add(spikemanBottom1)
        
        
        
        //let randomTopPosition = RandomGenerator.getRandomEdgePointFor(screenEdge: .Top)
        //let spikemanTop1 = GKSpikemanTop(scalingFactor: 0.40, position: randomTopPosition, movementLowerBound: nil, movementUpperBound: nil)
       // entitiesManager.add(spikemanTop1)
        
    }
    
    override func sceneDidLoad() {
        motionManager.startDeviceMotionUpdates()
        motionManager.deviceMotionUpdateInterval = 0.50
        
        //Perform basic scene configuration
        backgroundColor = ColorGenerator.getColor(colorType: .SkyBlue)
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
    }
    
    func adjustCameraScale(sender: UIPinchGestureRecognizer){
        
        if(sender.state == .began || sender.state == .changed){
            
            let scaleFactor = sender.scale
            let pinchVelocity = sender.velocity
            
            print(pinchVelocity)
            
            if(pinchVelocity < 0.001 && pinchVelocity > -0.001){
                self.camera?.xScale *= scaleFactor*0.40
                self.camera?.yScale *= scaleFactor*0.40
            }
            
        }
    }
    
    //MARK: ********* Game Loop functions
    
    override func update(_ currentTime: TimeInterval) {
        // Initialize _lastUpdateTime if it has not already been
        if (self.lastUpdateTime == 0) {
            self.lastUpdateTime = currentTime
        }
        
        let dt = currentTime - lastUpdateTime
        lastUpdateTime = currentTime
        
        entitiesManager.update(dt)
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
