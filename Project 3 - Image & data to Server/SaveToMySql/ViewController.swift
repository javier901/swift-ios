//
//  ViewController.swift
//  SaveToMySql
//
//  Created by Debaleena on 17/03/2020.
//  All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    //URL to our web service
    let URL_STR: URL = URL(string: "http://localhost/Demos/uploadContact.php")!
    
    @IBOutlet weak var nameInput: UITextField!
    @IBOutlet weak var phInput: UITextField!
    
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var pressSend: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    // Add image from local library
    @IBAction func addImage(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        picker.sourceType = .photoLibrary
        present(picker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let userPickedImage = info[.editedImage] as? UIImage else { return }
        myImage.image = userPickedImage
        
        picker.dismiss(animated: true)
    }

    
    @IBAction func uploadData(_ sender: Any) {

        //creating URLRequest
        var request = URLRequest(url: URL_STR)
        
        //setting the method to post
        request.httpMethod = "POST"
        
        //getting values from text fields
        
        let nameData = nameInput.text
        let phData = phInput.text
        let imageData = (myImage.image)!.jpegData(compressionQuality: 0.7)
        let encodedString = imageData!.base64EncodedString(options: .lineLength64Characters)
        
        let mainJSON = [
            "name" : nameData,
            "phone" : phData,
            "picture" : encodedString
        ]
        
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: mainJSON, options: [])
            request.httpBody = jsonData

        } catch {
            print("error")
        }
        
        //creating a task to send the post request
        let task = URLSession.shared.dataTask(with: request as URLRequest){
            data, response, error in
            if error != nil{
                print("error!")
                return; }
            do {
                
                // Information returned from the server is formatted as JSON (JavaScript Object Notation) data
                // JSONSerialization class can be used to convert JSON into Swift data types
                
                let myJSON = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary
                if let parseJSON = myJSON {
                    var messsg: String!
                    messsg = parseJSON["message"] as! String?
                    print(messsg)
                }
            } catch {
                print(error)
            }
        }
        
        //executing the task
        task.resume()
    }
}

