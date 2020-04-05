//
//  ViewController.swift
//  FoodDetector
//
//  Created by Debaleena on 05/04/2020.
//  Copyright © 2020 LIRIS.sampleDemos. All rights reserved.
//

import UIKit
import CoreML
import Vision

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var myImg: UIImageView!
    @IBOutlet weak var classificationLabel: UILabel!
    
    var selectedImage = CIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
// ********************************************  Image Picker    *********************************************************

    @IBAction func pickImage(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        picker.sourceType = .photoLibrary
        self.present(picker, animated: true, completion: nil)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        
        let info = convertFromUIImagePickerControllerInfoKeyDictionary(info) // Local variable inserted by Swift 4.2 migrator.
        picker.dismiss(animated: true)
        
        let image = info[convertFromUIImagePickerControllerInfoKey(UIImagePickerController.InfoKey.originalImage)] as! UIImage
        
        myImg.image = image
        
        if let ciImage = CIImage(image: myImg.image!) {
            self.selectedImage = ciImage
        }
        
        detectScene(image: selectedImage)
        
    }
    
// ******************************************   Make classification request   ***************************************************
    
    func detectScene(image: CIImage) {
        classificationLabel.text = "Detecting food..."
        
        if let model = try? VNCoreMLModel(for: Food11().model) {
            let request = VNCoreMLRequest(model: model, completionHandler: { (vnrequest, error) in
                if let results = vnrequest.results as? [VNClassificationObservation] {
                    let topResult = results.first
                    DispatchQueue.main.async {
                        let confidenceRate = (topResult?.confidence)! * 100
                        let rounded = Int (confidenceRate * 100) / 100
                        self.classificationLabel.text = "\(rounded)% it's \(topResult?.identifier ?? "Unknown")"
                    }
                }
            })
            let handler = VNImageRequestHandler(ciImage: image)
            DispatchQueue.global(qos: .userInteractive).async {
                do {
                    try handler.perform([request])
                } catch {
                    print("Err :(")
                }
            }
        }
    }
}

// *****************************************   Helper Functions    *********************************************************

fileprivate func convertFromUIImagePickerControllerInfoKeyDictionary(_ input: [UIImagePickerController.InfoKey: Any]) -> [String: Any] {
    return Dictionary(uniqueKeysWithValues: input.map {key, value in (key.rawValue, value)})
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromUIImagePickerControllerInfoKey(_ input: UIImagePickerController.InfoKey) -> String {
    return input.rawValue
}

