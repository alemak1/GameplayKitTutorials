//
//  InstructionController.swift
//  FantasticFurryDrifters
//
//  Created by Aleksander Makedonski on 4/8/17.
//  Copyright © 2017 AlexMakedonski. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit


class GameCharacterController: UIViewController, UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
    
    fileprivate let reuseIdentifier = "GameCharacterCell"
    fileprivate let sectionInsets = UIEdgeInsets(top: 180.00, left: 20.00, bottom: 50.00, right: 20.0)
    
    var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10.00, left: 30.0, bottom: 20.00, right: 30.0)
        layout.itemSize = CGSize(width: 90, height: 120)
        
        collectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
          collectionView.register(GameCharacterCell.self, forCellWithReuseIdentifier: "GameCharacterCell")
        collectionView.backgroundColor = ColorGenerator.getColor(colorType: .SkyBlue)
        view.addSubview(collectionView)
        
    
    }
}

//MARK: ******** UICollectionViewDataSource
extension GameCharacterController{
     func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return CharacterProfileSet.profilesArray.count
    }
    
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return CharacterProfileSet.profilesArray[section].count
    }
    
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GameCharacterCell", for: indexPath) as! GameCharacterCell
        
        let characterProfile = characterProfileForIndexPath(indexPath: indexPath)
        
        cell.imageView.image = characterProfile.image
        cell.titleLabel.text = characterProfile.title
        
        return cell
        
        
    }
    
    
    

}

extension GameCharacterController{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //TODO: Implement this method to generate modal view introducing the character
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        
    }
    
    
}

extension GameCharacterController{
  
    /**
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1.00
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.zero
    }
     **/
}


private extension GameCharacterController{
    
    func characterProfileForIndexPath(indexPath: IndexPath) -> CharacterProfile{
        return CharacterProfileSet.profilesArray[(indexPath as NSIndexPath).section][(indexPath as NSIndexPath).row]
    }
    
}
