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
    
    var node: SKCameraNode
    var pinchGestureRecognier: UIPinchGestureRecognizer = UIPinchGestureRecognizer(target: self, action: #selector(GKCameraComponent.adjustCameraZoomLevel(sender:)))
    
    init(userInteractionEnabled: Bool = true) {
        
        node = SKCameraNode()
        node.isUserInteractionEnabled = userInteractionEnabled
        
        super.init()

        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setInitialPositionOfCamera(){
        if let parentEntitySpriteNode = self.entity?.component(ofType: GKSpriteComponent.self)?.node{
            node.position = parentEntitySpriteNode.position
        }
    }
    
   
    override func update(deltaTime seconds: TimeInterval) {
      
    }
    
    
    func adjustCameraZoomLevel(sender: UIPinchGestureRecognizer){
        if(sender.state == .began || sender.state == .changed){
            if let parentSpriteNode = self.entity?.component(ofType: GKSpriteComponent.self)?.node{
                
                let scaleFactor = sender.scale
                parentSpriteNode.xScale *= scaleFactor
                parentSpriteNode.yScale *= scaleFactor
            }
        }
    }
}
