//
//  TableViewController.swift
//  Basics1
//
//  Created by Debaleena on 21/02/2020.
//  Copyright © 2020 LIRIS.sampleDemos. All rights reserved.
//  Description hints taken from wikipedia, www.thecrazytourist.com/15-best-things-lyon-france/ blog

import UIKit

var activities = ["History", "Park", "Musuem"]

var actHeading = ["Ancient Theatre of Fourvière",
                  "Parc de la Tête d’Or",
                  "Musée Miniature et Cinéma"]

var actDesc = ["A Roman theatre originally built around 15BC, and recontructed later, sits high on the left bank of the Saône River. Today the theatre is primarily a tourist site, but is still used as a cultural venue.",
               "One of the largest urban parks in the country, with a zoo and France’s foremost botanical garden within its boundaries.",
               "Over 100 “hyper-realistic” miniature scenes made by the world’s best miniaturists, and possess painstaking detail and craftsmanship. "]

var actAddress = ["Rue de l'Antiquaille, 69005 Lyon",
                "69006 Lyon",
                "60 Rue Saint-Jean, 69005 Lyon"]

var myIndex = 0

class TableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return activities.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = activities[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        myIndex = indexPath.row
        performSegue(withIdentifier: "segue", sender: self)
    }
}
