//
//  ColorGenerator.swift
//  FantasticFurryDrifters
//
//  Created by Aleksander Makedonski on 4/7/17.
//  Copyright © 2017 AlexMakedonski. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit

class ColorGenerator{
    
    enum ColorType{
        case SkyBlue
        case DarkGrey
        case LightGrey
    }
    
    static let colorDict: [ColorType: UIColor] = [
        .SkyBlue : UIColor(colorLiteralRed: 146/255.0, green: 200/255.0, blue: 255/255.0, alpha: 1.0),
        .DarkGrey: UIColor(colorLiteralRed: 131/255.0, green: 134/255.0, blue: 137/255.0, alpha: 1.0),
        .LightGrey: UIColor(colorLiteralRed: 217/255.0, green: 218/255.0, blue: 219/255.0, alpha: 1.0)
    ]
    
    static func getColor(colorType: ColorType) -> UIColor{
        return colorDict[colorType]!
    }
}
