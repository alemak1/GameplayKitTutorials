//
//  GameCharacterCollectionLayout.swift
//  FantasticFurryDrifters
//
//  Created by Aleksander Makedonski on 4/8/17.
//  Copyright © 2017 AlexMakedonski. All rights reserved.
//

import Foundation
import UIKit

class GameCharacterCollectionLayout: UICollectionViewLayout{
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    /**
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        var layoutAttributes = [UICollectionViewLayoutAttributes]()
        
        let header1_IP = IndexPath()
        let header1 = UICollectionViewLayoutAttributes(forDecorationViewOfKind: "header1", with: header1_IP)
        
        layoutAttributes.append(header1)
        
        return layoutAttributes
    
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        
    }
    
    override func layoutAttributesForDecorationView(ofKind elementKind: String, at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        
    }
    
    override func layoutAttributesForSupplementaryView(ofKind elementKind: String, at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        
    }
    
    override func layoutAttributesForInteractivelyMovingItem(at indexPath: IndexPath, withTargetPosition position: CGPoint) -> UICollectionViewLayoutAttributes {
        
    }
     **/
}
