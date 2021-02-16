//
//  ViewController.swift
//  QR_Generator
//
//  Created by yogendra singh on 2/15/21.
//  Copyright © 2021 yadavboy. All rights reserved.
//


import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myTextField: UITextField!
    @IBOutlet weak var myImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func button(_ sender: Any) {
        
        if myTextField.text != nil {
            
            myImageView.image = generateQRCode(from: myTextField.text!)
            
        }else {
            myImageView.image = generateQRCode(from: "I hate You!")
        }
        
        
    }
    
    func generateQRCode(from string:String) -> UIImage? {
        
        let data = string.data(using: String.Encoding.ascii)
        
        if let filter = CIFilter(name: "CIQRCodeGenerator"){
            
            filter.setValue(data, forKey: "inputMessage")
            
            let transform = CGAffineTransform(scaleX: 3, y: 3)
            
            if let output = filter.outputImage?.transformed(by: transform) {
                return UIImage(ciImage: output)
            }
            
        }
        
        return nil
        
    }
    
}

