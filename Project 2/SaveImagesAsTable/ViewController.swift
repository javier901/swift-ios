//
//  ViewController.swift
//  SaveImagesAsTable
//
//  Created by Debaleena on 27/02/2020.
//  Copyright © 2020 LIRIS.sampleDemos. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet weak var titleTxt: UITextField!
    @IBOutlet weak var authorTxt: UITextField!
    @IBOutlet weak var coverImg: UIImageView!

    @IBOutlet weak var addPhoto: UIButton!
    @IBOutlet weak var saveEntry: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
//    **************************************************************************************
    
    
    @IBAction func addImage(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        picker.sourceType = .photoLibrary
        present(picker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let userPickedImage = info[.editedImage] as? UIImage else { return }
        coverImg.image = userPickedImage
        
        picker.dismiss(animated: true)
    }
    
//    **************************************************************************************
    
    @IBAction func addEntry(_ sender: Any) {
        
        let imgData = (coverImg?.image)!.pngData()
        let titleText = self.titleTxt.text!
        let authorText = self.authorTxt.text!
        
        let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
        let newUser = NSEntityDescription.insertNewObject(forEntityName: "Book", into: context!)
        
         newUser.setValue(imgData, forKey: "cover")
        newUser.setValue(titleText, forKey: "title")
        newUser.setValue(authorText, forKey: "author")
        
        do {
            try context?.save()
            print("Book title, author and cover image are saved")
        }
        catch {
            print(error.localizedDescription)
        }
    }
    

}
