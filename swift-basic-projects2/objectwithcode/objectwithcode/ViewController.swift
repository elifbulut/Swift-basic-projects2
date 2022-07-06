//
//  ViewController.swift
//  objectwithcode
//
//  Created by Elıf on 31.03.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        let width = view.frame.size.width
        let height
        
        let myLabel = UILabel()
        myLabel.text = "Test Label"
        myLabel.textAlignment = .center
        myLabel.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        view.addSubview(myLabel)
        
    }


}

