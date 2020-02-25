//
//  RoundButton.swift
//  Basics1
//
//  Created by Debaleena on 25/02/2020.
//  Copyright © 2020 LIRIS.sampleDemos. All rights reserved.
//

import UIKit

class RoundButton: UIButton {

    @IBInspectable var cornerRadius: CGFloat = 0{
        didSet{
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0{
        didSet{
            self.layer.borderWidth = borderWidth
        }
    }

}
