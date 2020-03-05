//
//  SecondViewController.swift
//  Basics1
//
//  Created by Debaleena on 21/02/2020.
//  Copyright © 2020 LIRIS.sampleDemos. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        myImage.image = UIImage(named: activities[myIndex]+".jpg")
        
        topLabel.text = actHeading[myIndex]
        descLabel.text = actDesc[myIndex]
        addressLabel.text = actAddress[myIndex]
        
        
    }
    

    

}
