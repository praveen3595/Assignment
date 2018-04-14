//
//  UIButtonX.swift
//  RedDoorz
//
//  Created by Praveen Singh on 13/04/18.
//  Copyright © 2018 Praveen Singh. All rights reserved.
//

import UIKit

@IBDesignable
class UIButtonX: UIButton {
    
    
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    

    

}
