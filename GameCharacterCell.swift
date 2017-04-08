//
//  GameCharacterCard.swift
//  FantasticFurryDrifters
//
//  Created by Aleksander Makedonski on 4/8/17.
//  Copyright © 2017 AlexMakedonski. All rights reserved.
//

import Foundation
import UIKit

class GameCharacterCell: UICollectionViewCell{
    
    var titleLabel: UILabel!
    var imageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
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
        imageView.contentMode = UIViewContentMode.scaleAspectFit
        
        let labelFrameWidth = imageViewFrame.width*0.90
        let labelFrameHeight = imageViewFrame.height*0.90
      //  let labelFrameXPos = imageViewFrame.height*0.05
       // let labelFrameYPos = imageViewFrame.height*0.90
    
        let labelFrame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
        titleLabel = UILabel(frame: labelFrame)
        titleLabel.font = UIFont(name: FontNames.NoteworthyBold, size: 10.0)
        titleLabel.textAlignment = .center
        titleLabel.textColor = ColorGenerator.getColor(colorType: .RedCollectionCellFontColor)
    
        imageView.addSubview(titleLabel)
        contentView.addSubview(imageView)
        
    }
    
    
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
