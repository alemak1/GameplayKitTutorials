//
//  CharacterProfileVC.swift
//  FantasticFurryDrifters
//
//  Created by Aleksander Makedonski on 4/8/17.
//  Copyright © 2017 AlexMakedonski. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit



class CharacterProfileVC: UIViewController{
    
    var characterProfileScene: CharacterProfileScene?
    var skView: SKView?
    
    var gameCharacter: GameCharacter = .Spikeman
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
    }
    
    convenience init(gameCharacter: GameCharacter) {
        self.init(nibName: nil, bundle: nil)
        
        self.gameCharacter = gameCharacter
        
        let width = view.bounds.width*0.50
        let height = view.bounds.height*0.50
        let sceneSize = CGSize(width: width, height: height)
        
        switch(gameCharacter){
            case .Spikeman:
                characterProfileScene = CharacterProfileScene(size: sceneSize, gameCharacter: .Spikeman)
                break
            default:
                break
        }
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
    
        if(characterProfileScene != nil){
            
            skView?.translatesAutoresizingMaskIntoConstraints = false
            
            let insetDeltaX = view.bounds.width*0.30
            let insetDeltaY = view.bounds.height*0.40
            
            let skViewRect = view.bounds.insetBy(dx: insetDeltaX, dy: insetDeltaY)
            skView = SKView(frame: skViewRect)
    
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let characterScene = self.characterProfileScene{
            skView?.presentScene(characterScene)
        }
    }
    
    
}
