//
//  superMusician.swift
//  musicianClass
//
//  Created by Elıf on 16.04.2022.
//

import Foundation

class superMusicians : Musicians {
    
    func sing2(){
        print("enter night")
    }
    
    override func sing() {
        super.sing()
        print("exit light")
    }
}
