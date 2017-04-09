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
        /**
        collectionView.register(GameCharacterHeader.self, forSupplementaryViewOfKind: "GameCharacterHeader", withReuseIdentifier: "GameCharacterHeader")
        collectionView.register(GameCharacterFooter.self, forSupplementaryViewOfKind: "GameCharacterFooter", withReuseIdentifier: "GameCharacterFooter")
        **/
        
        collectionView.backgroundColor = ColorGenerator.getColor(colorType: .SkyBlue)
        view.addSubview(collectionView)
        
    
    }
}

//MARK: ******** UICollectionViewDataSource
extension GameCharacterController{
     func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return GameCharacter.profilesArray.count
    }
    
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return GameCharacter.profilesArray[section].count
    }
    
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GameCharacterCell", for: indexPath) as! GameCharacterCell
        
        let gameCharacter = gameCharacterForIndexPath(indexPath: indexPath)
        
        var backgroundImageView = UIImageView(frame: cell.frame)
        backgroundImageView.contentMode = UIViewContentMode.scaleAspectFit

        var selectedBackgroundImageView = UIImageView(frame: cell.frame)
        selectedBackgroundImageView.contentMode = UIViewContentMode.scaleAspectFit

        switch(indexPath.section){
            case 0:
                backgroundImageView.image = #imageLiteral(resourceName: "red_button06")
                selectedBackgroundImageView.image = #imageLiteral(resourceName: "red_button07")
                break
            case 1:
                backgroundImageView.image = #imageLiteral(resourceName: "green_button09")
                selectedBackgroundImageView.image = #imageLiteral(resourceName: "green_button10")
                break
            case 2:
                backgroundImageView.image = #imageLiteral(resourceName: "yellow_button09")
                selectedBackgroundImageView.image = #imageLiteral(resourceName: "yellow_button10")
                break
            default:
                backgroundImageView.image = #imageLiteral(resourceName: "red_button06")
                selectedBackgroundImageView.image = #imageLiteral(resourceName: "red_button07")
                break
            
            
        }
        
        cell.backgroundView = backgroundImageView
        cell.selectedBackgroundView = selectedBackgroundImageView
        
        cell.characterImage = gameCharacter.image
        
        //TODO: *********** FIX BUG ASSOCIATED WITH ADDING CELL TITLE
        //cell.characterTitle = gameCharacter.title
        cell.gameCharacter = gameCharacter
        
        let cellTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(GameCharacterController.presentCharacterProfileVC(sender:)))
        
        cell.addGestureRecognizer(cellTapGestureRecognizer)
        
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
    
   
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        return UICollectionReusableView()
        /**
        var supplementaryView: UICollectionReusableView = UICollectionReusableView()
    
        switch(indexPath.section){
            case 0:
                if let supplementaryView = collectionView.dequeueReusableSupplementaryView(ofKind: "GameCharacterHeader", withReuseIdentifier: "GameCharacterHeader", for: indexPath) as? GameCharacterHeader{
                    
                    supplementaryView.titleText = "Enemies"
                    supplementaryView.backgroundImage = #imageLiteral(resourceName: "yellow_button13")
                }
                
                break
            case 1:
                if let supplementaryView = collectionView.dequeueReusableSupplementaryView(ofKind: "GameCharacterHeader", withReuseIdentifier: "GameCharacterHeader", for: indexPath) as? GameCharacterHeader{
                    
                    supplementaryView.titleText = "Items"
                    supplementaryView.backgroundImage = #imageLiteral(resourceName: "yellow_button13")
                }
                break
            case 2:
                if let supplementaryView = collectionView.dequeueReusableSupplementaryView(ofKind: "GameCharacterHeader", withReuseIdentifier: "GameCharacterHeader", for: indexPath) as? GameCharacterHeader{
                    
                    supplementaryView.titleText = "Carrots"
                    supplementaryView.backgroundImage = #imageLiteral(resourceName: "yellow_button13")
                }
                break
            case 3:
                if let supplementaryView = collectionView.dequeueReusableSupplementaryView(ofKind: "GameCharacterHeader", withReuseIdentifier: "GameCharacterHeader", for: indexPath) as? GameCharacterHeader{
                    
                    supplementaryView.titleText = "Coins"
                    supplementaryView.backgroundImage = #imageLiteral(resourceName: "yellow_button13")
                }
                break
            default:
                if let supplementaryView = collectionView.dequeueReusableSupplementaryView(ofKind: "GameCharacterHeader", withReuseIdentifier: "GameCharacterHeader", for: indexPath) as? GameCharacterHeader{
                    
                    supplementaryView.titleText = "Game Objects"
                    supplementaryView.backgroundImage = #imageLiteral(resourceName: "yellow_button13")
                }
                break
        }
        
        return supplementaryView
        **/
        
        /**
        switch(kind){
        case "GameCharacterHeader":
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: "GameCharacterHeader", withReuseIdentifier: "GameCharacterHeader", for: indexPath) as! GameCharacterHeader
            
            return headerView
            
            break
        case "GameCharacterFooter":
            let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: "GameCharacterFooter", withReuseIdentifier: "GameCharacterFooter", for: indexPath) as! GameCharacterFooter
            
            return footerView
            break
        default:
            break
        }
        **/
        
    }

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
    
    @objc func presentCharacterProfileVC(sender: UITapGestureRecognizer){
        
        let point = sender.location(in: collectionView)
        
        if let cell = sender.view as? GameCharacterCell, let gameCharacter = cell.gameCharacter{
            
            let charProfileVC = CharacterProfileVC(gameCharacter: gameCharacter)
            navigationController?.pushViewController(charProfileVC, animated: true)

        }
        
    }
}

private extension GameCharacterController{
    
    func gameCharacterForIndexPath(indexPath: IndexPath) -> GameCharacter{
        return GameCharacter.profilesArray[(indexPath as NSIndexPath).section][(indexPath as NSIndexPath).row]
    }
    
}
