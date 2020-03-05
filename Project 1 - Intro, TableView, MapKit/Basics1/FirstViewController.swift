//
//  FirstViewController.swift
//  Basics1
//
//  Created by Debaleena on 21/02/2020.
//  Copyright © 2020 LIRIS.sampleDemos. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var myImage: UIImageView!
    
    @IBOutlet weak var clickWeb: UIButton!
    @IBOutlet weak var descLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        topLabel.text = "Lyon"
        myImage.image = UIImage(named:"lyon.jpg")
        descLabel.text = "Lyon, the capital city in France’s Auvergne-Rhône-Alpes region, sits at the junction of the Rhône and Saône rivers. \n\nIts center reflects 2,000 years of history from the Roman Amphithéâtre des Trois Gaules, medieval and Renaissance architecture in Vieux (Old) Lyon, to the modern Confluence district on Presqu'île peninsula.\n\nAlso known as the gastronomical capital of France, Lyon is vibrant with culinary experiences, fun activities, beautiful parks and has easy access to natural places in the Alps.\n\nRead more on the web by clicking the button below or check out our favorites in Lyon!"
        
        
        
    }

    @IBAction func goToWeb(_ sender: Any) {
        openUrl(urlStr: "https://en.wikipedia.org/wiki/Lyon")
    }
    
    func openUrl(urlStr: String!) {
        if let url = URL(string:urlStr), !url.absoluteString.isEmpty {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}

