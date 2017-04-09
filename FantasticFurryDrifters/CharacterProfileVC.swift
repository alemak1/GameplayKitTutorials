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
import GameplayKit


class CharacterProfileVC: UIViewController{
    
    var characterProfileScene: CharacterProfileScene?
    var sceneView: SKView?
    var titleLabel: UILabel?
    var descriptionLabel: UILabel?
    
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
        
    
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        
        //Set background color for the CharacterProfileScene
        view.backgroundColor = ColorGenerator.getColor(colorType: .SkyBlue)

        //Set the SceneView and LabelViews
        sceneView = SKView()
        titleLabel = UILabel()
        descriptionLabel = UILabel()
        
        if let sceneView = sceneView, let titleLabel = titleLabel, let descriptionLabel = descriptionLabel{
            
            view.addSubview(sceneView)
            view.addSubview(titleLabel)
            view.addSubview(descriptionLabel)
            
            
            titleLabel.font = UIFont(name: FontNames.NoteworthyBold, size: 60.0)
            titleLabel.textAlignment = .center
            titleLabel.text = gameCharacter.title
            
            descriptionLabel.font = UIFont(name: FontNames.Noteworthy, size: 20.0)
            descriptionLabel.textAlignment = .center
            descriptionLabel.adjustsFontSizeToFitWidth = true
            descriptionLabel.textColor = ColorGenerator.getColor(colorType: .DeepSeaBlue)
            descriptionLabel.numberOfLines = 0
            descriptionLabel.text = gameCharacter.description
    
        
            //Configure the constraints for all the subviews
            sceneView.translatesAutoresizingMaskIntoConstraints = false
            descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
            titleLabel.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
              
                titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0.0),
                titleLabel.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 10.0),
                titleLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.90),
                titleLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.10),
                
                sceneView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0.00),
                sceneView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30.00),
                sceneView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.50),
                sceneView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.30),
                
                descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0.0),
                descriptionLabel.topAnchor.constraint(equalTo: sceneView.bottomAnchor, constant: 10.00),
                descriptionLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.90),
                descriptionLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.40)
                
                ])
            
            let sceneSize = sceneView.frame.size
            
            characterProfileScene = CharacterProfileScene(size: sceneSize, gameCharacter: gameCharacter)
            
            if let characterProfileScene = characterProfileScene{
                characterProfileScene.scaleMode = .resizeFill
                sceneView.presentScene(characterProfileScene)

            }
    
        }
        

    }
    
    
   
    
    
}
