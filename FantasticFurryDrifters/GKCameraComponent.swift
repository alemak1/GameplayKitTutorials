//
//  GKCameraComponent.swift
//  FantasticFurryDrifters
//
//  Created by Aleksander Makedonski on 4/8/17.
//  Copyright © 2017 AlexMakedonski. All rights reserved.
//

import Foundation
import GameplayKit
import SpriteKit

class GKCameraComponent: GKComponent{
    
    var cameraNode: SKCameraNode = SKCameraNode()
    var nodeOfFocus: SKSpriteNode?

    init(userInteractionEnabled: Bool = true) {
        super.init()
        cameraNode.isUserInteractionEnabled = userInteractionEnabled

        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func resetNodeOfFocus(toNodeOfCameraFocus nodeOfCameraFocus: SKSpriteNode){
        nodeOfFocus = nodeOfCameraFocus
        alignCameraWithNodeOfFocus()

    }
    
    func alignCameraWithNodeOfFocus(){
        
        guard let nodeOfFocus = nodeOfFocus else { return }
        
        cameraNode.position = nodeOfFocus.position
    }
    
   
    override func update(deltaTime seconds: TimeInterval) {
        alignCameraWithNodeOfFocus()
    }
    
    
    func adjustCameraZoomLevel(sender: UIPinchGestureRecognizer){
        
        guard let nodeOfFocus = nodeOfFocus else { return }
        
        if(sender.state == .began || sender.state == .changed){
          
            let scaleFactor = sender.scale
            nodeOfFocus.xScale *= scaleFactor
            nodeOfFocus.yScale *= scaleFactor
            
        }
    }
}
