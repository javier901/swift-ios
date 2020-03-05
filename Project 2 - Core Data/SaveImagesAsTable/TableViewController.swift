//
//  TableViewController.swift
//  SaveImagesAsTable
//
//  Created by Debaleena on 27/02/2020.
//  Copyright © 2020 LIRIS.sampleDemos. All rights reserved.
//

import UIKit
import CoreData

class myCell: UITableViewCell{
    
    @IBOutlet weak var myTitle: UILabel!
    @IBOutlet weak var myAuthor: UILabel!
    @IBOutlet weak var myCover: UIImageView!
}

// **********************************************

class TableViewController: UITableViewController {
    
    var items: [Book] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        RefreshData()
        self.title = "My Library"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        RefreshData()
        self.tableView.reloadData()
    }
    
    func RefreshData()
    {
        items = readItems("Book")
    }

    func readItems(_ entity:String) -> [Book]
    {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<NSFetchRequestResult>  = NSFetchRequest(entityName: entity)
        
        do{
            let fetchResults = try managedContext.fetch(fetchRequest)
            
            if let results = fetchResults as? [Book]
            {
                return results
            }
        }
        catch
        {
        }
        return  [Book]()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! myCell
        
        if let title = items[indexPath.row].value(forKey: "title") as? String
        {
            cell.myTitle.text = String(indexPath.row+1) + ". " + title
        }
        
        if let author = items[indexPath.row].value(forKey: "author") as? String
        {
            cell.myAuthor.text = "By: " + author
        }
        
        if let cover = items[indexPath.row].value(forKey: "cover") as? Data
        {
            cell.myCover.image = UIImage(data: cover)
        }
        
        return cell
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }
}
