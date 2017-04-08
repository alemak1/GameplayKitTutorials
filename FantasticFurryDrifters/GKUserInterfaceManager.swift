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
    
    init(managedScene: EnemyAgentScene, enableCamera: Bool){

        self.scene = managedScene
        
        super.init()

        if(enableCamera){
            addCameraComponent()
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addCameraComponent(){
        let cameraComponent = GKCameraComponent(userInteractionEnabled: true)
        addComponent(cameraComponent)
    }
}
