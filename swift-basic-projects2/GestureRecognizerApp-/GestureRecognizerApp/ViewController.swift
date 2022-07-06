//
//  ViewController.swift
//  GestureRecognizerApp
//
//  Created by Elıf on 9.04.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var myLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.isUserInteractionEnabled = true
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(changePic))
    
        imageView.addGestureRecognizer(gestureRecognizer)
    }
    
    @objc func changePic(){
        
        var isJ
        
        imageView.image = UIImage(named: "lars")
        myLabel.text = "Lars Ulrich"
        
    }


}

