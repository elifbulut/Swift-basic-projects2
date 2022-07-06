//
//  imageViewController.swift
//  LandmarkBook
//
//  Created by Elıf on 16.04.2022.
//

import UIKit

class imageViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    var selectedlandmarkName = "" //bos
    var selectedlandmarkImage = UIImage()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = selectedlandmarkName
        imageView.image = selectedlandmarkImage

       
    }
    

}
