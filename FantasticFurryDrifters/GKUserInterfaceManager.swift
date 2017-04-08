//
//  GKUserInterfaceManager.swift
//  FantasticFurryDrifters
//
//  Created by Aleksander Makedonski on 4/8/17.
//  Copyright © 2017 AlexMakedonski. All rights reserved.
//

import Foundation
import GameplayKit
import SpriteKit


class GKUserInterfaceManager: GKEntity{
    
    
    weak var scene: EnemyAgentScene?
    
    var pinchGestureRecognier: UIPinchGestureRecognizer = UIPinchGestureRecognizer(target: self, action: #selector(GKCameraComponent.adjustCameraZoomLevel(sender:)))
    

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(managedScene: EnemyAgentScene, enableCamera: Bool){

        self.scene = managedScene
        
        super.init()

        if(enableCamera){
           addCameraComponent()
            scene?.view?.addGestureRecognizer(pinchGestureRecognier)
        }
        
    }
    
    

}

extension GKUserInterfaceManager{
    
    func addCameraComponent(){
        let cameraComponent = GKCameraComponent(userInteractionEnabled: true)
        addComponent(cameraComponent)

        
        guard let playerNode = self.scene?.entitiesManager.getCurrentUserPlayer()?.component(ofType: GKSpriteComponent.self)?.node else { return }
        
        self.scene?.camera = cameraComponent.cameraNode
        cameraComponent.resetNodeOfFocus(toNodeOfCameraFocus: playerNode)
    }
}
