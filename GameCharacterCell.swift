//
//  GameCharacterCard.swift
//  FantasticFurryDrifters
//
//  Created by Aleksander Makedonski on 4/8/17.
//  Copyright © 2017 AlexMakedonski. All rights reserved.
//

import Foundation
import UIKit

/**
class GameCharacterHeader: UICollectionReusableView{
    
     private var imageView: UIImageView?
     private var headerTitle: UILabel?
    

    var backgroundImage: UIImage?{
        
        set(newImage){
            imageView?.image = newImage
        }
        
        get{
            return imageView?.image
        }
    }
    
    var titleText: String?{
        set(newTitleText){
            headerTitle?.text = newTitleText
        }
        
        get{
            return headerTitle.text
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageView = UIImageView(image: #imageLiteral(resourceName: "green_button13"))
        headerTitle = UILabel(frame: imageView.bounds)
        imageView.addSubview(headerTitle)
        
        self.addSubview(imageView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
 
 **/

class GameCharacterFooter: UICollectionReusableView{
    
    
}

class GameCharacterCell: UICollectionViewCell{
    
    private var titleLabel: UILabel?
    private var imageView: UIImageView?
    
    var gameCharacter: GameCharacter?
    
    var characterTitle: String?{
        set(newTItle){
            if let charTitle = newTItle{
                titleLabel?.text = charTitle
            }
        }
        
        get{
            return titleLabel?.text
        }
    }
    
    var characterImage: UIImage?{
        set(newImage){
            if let charImg = newImage{
                imageView?.image = charImg
            }
        }
        
        get{
            return imageView?.image
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureContentView()

    }
    
    
    convenience init(gameCharacter: GameCharacter, frame: CGRect) {
        self.init(frame: frame)
        self.gameCharacter = gameCharacter
    }
    
    
 
    
    private func configureContentView(){
        let backgroundImageView = UIImageView(frame: frame)
        backgroundImageView.image = #imageLiteral(resourceName: "red_button06")
        backgroundImageView.contentMode = UIViewContentMode.scaleAspectFit
        backgroundView = backgroundImageView
        
        let selectedBackgroundImageView = UIImageView(frame: frame)
        selectedBackgroundImageView.image = #imageLiteral(resourceName: "red_button07")
        selectedBackgroundImageView.contentMode = UIViewContentMode.scaleAspectFit
        selectedBackgroundView = selectedBackgroundImageView
        
        let xInset = frame.size.width*0.10
        let yInset = frame.size.height*0.08
        
        let imageViewFrame = CGRect(x: backgroundImageView.frame.width*0.10, y: backgroundImageView.frame.height*0.20, width: backgroundImageView.frame.width*0.80, height: backgroundImageView.frame.height*0.50)
        imageView = UIImageView(frame: imageViewFrame)
        imageView?.contentMode = UIViewContentMode.scaleAspectFit
        
        let labelFrameWidth = imageViewFrame.width*0.90
        let labelFrameHeight = imageViewFrame.height*0.90
        //  let labelFrameXPos = imageViewFrame.height*0.05
        // let labelFrameYPos = imageViewFrame.height*0.90
        
        let labelFrame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
        titleLabel = UILabel(frame: labelFrame)
        
        titleLabel?.font = UIFont(name: FontNames.NoteworthyBold, size: 10.0)
        titleLabel?.textAlignment = .center
        titleLabel?.textColor = ColorGenerator.getColor(colorType: .RedCollectionCellFontColor)
        

        if(imageView != nil){
            if(titleLabel != nil){
                imageView!.addSubview(titleLabel!)
            }
            contentView.addSubview(imageView!)
        }
  
        
    }
}
