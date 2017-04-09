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
        case PeachYellow
        case DeepSeaBlue
        case DarkGrey
        case LightGrey
        case RedCollectionCellFontColor
    }
    
    static let colorDict: [ColorType: UIColor] = [
        .SkyBlue : UIColor(colorLiteralRed: 146/255.0, green: 200/255.0, blue: 255/255.0, alpha: 1.0),
        .DarkGrey: UIColor(colorLiteralRed: 131/255.0, green: 134/255.0, blue: 137/255.0, alpha: 1.0),
        .LightGrey: UIColor(colorLiteralRed: 217/255.0, green: 218/255.0, blue: 219/255.0, alpha: 1.0),
        .RedCollectionCellFontColor: UIColor(colorLiteralRed: 82/255.0, green: 136/255.0, blue: 206/255.0, alpha: 1.00),
        .PeachYellow: UIColor(colorLiteralRed: 255/255.0, green: 225.0/255.0, blue: 138/255.0, alpha: 1.00),
        .DeepSeaBlue : UIColor(colorLiteralRed: 35/255.0, green: 60/255.0, blue: 145/255.0, alpha: 1.00)
    ]
    
    static func getColor(colorType: ColorType) -> UIColor{
        return colorDict[colorType]!
    }
}
