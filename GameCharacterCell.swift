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
        set(newText){
            if let characterTitle = newText, let label = titleLabel{
                label.text = characterTitle
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
        configureContentView(primaryFrame: frame)

    }
    
    
    convenience init(gameCharacter: GameCharacter, frame: CGRect) {
        self.init(frame: frame)
        self.gameCharacter = gameCharacter
    }
    
    
 
    
    private func configureContentView(primaryFrame: CGRect){
        
        //Background views for the cell (in both selected and unselected state) are set to a default image but can changed dynamically in the data source and delegate methods for the collection view
        configureDefaultBackgroundView(primaryFrame: primaryFrame)
        
      
        //Configure the dimensions for the ImageView; the image will be set dynamically in the data source method for the collection view
        let imageViewFrame = CGRect(x: primaryFrame.width*0.10, y: primaryFrame.height*0.20, width: primaryFrame.size.width*0.80, height: primaryFrame.size.height*0.50)
        
        configureCellImageView(imageViewFrame: imageViewFrame)
      
        
        //Configure the dimensions for the LabelView; the text will be set dynamically in the data source method for the collection view
        configureTitleLabel(imageViewFrame: imageViewFrame)
    
        //Add the ImageView and LabelView as subviews to the cell's contentView
        addCellSubviews()
        
    }
    
    private func configureDefaultBackgroundView(primaryFrame: CGRect){
        let backgroundImageView = UIImageView(frame: primaryFrame)
        backgroundImageView.image = #imageLiteral(resourceName: "red_button06")
        backgroundImageView.contentMode = UIViewContentMode.scaleAspectFit
        backgroundView = backgroundImageView
        
        let selectedBackgroundImageView = UIImageView(frame: primaryFrame)
        selectedBackgroundImageView.image = #imageLiteral(resourceName: "red_button07")
        selectedBackgroundImageView.contentMode = UIViewContentMode.scaleAspectFit
        selectedBackgroundView = selectedBackgroundImageView
    }
    
    private func configureTitleLabel(imageViewFrame: CGRect){
        let labelFrameWidth = imageViewFrame.width*0.90
        let labelFrameHeight = imageViewFrame.height*0.90
        let labelFrameXPos = CGFloat(0.0) // imageViewFrame.height*0.05
        let labelFrameYPos = CGFloat(0.0) //imageViewFrame.height*0.90
        
        let labelFrame = CGRect(x: labelFrameXPos, y: labelFrameYPos, width: labelFrameWidth, height: labelFrameHeight)
        
        titleLabel = UILabel(frame: labelFrame)
        
        if let label = titleLabel{
            label.font = UIFont(name: FontNames.NoteworthLight, size: 10.0)
            label.textAlignment = .center
            label.textColor = ColorGenerator.getColor(colorType: .RedCollectionCellFontColor)
        
        }
    }

    
    private func configureCellImageView(imageViewFrame: CGRect){
        imageView = UIImageView(frame: imageViewFrame)
        imageView?.contentMode = UIViewContentMode.scaleAspectFit
        
    }
    
    
    private func addCellSubviews(){
        if(imageView != nil && titleLabel != nil){
            imageView!.addSubview(titleLabel!)
            contentView.addSubview(imageView!)
        }
        
    }
}
