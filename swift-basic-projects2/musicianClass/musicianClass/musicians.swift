 //
//  musicians.swift
//  musicianClass
//
//  Created by Elıf on 16.04.2022.
//

import Foundation

enum MusicianType {
    case LeadGuitar
    case Vocalist
    case Drummer
    case Bassist
    case Violenist
}

class Musicians {
    //properties
    var name : String
    var age : Int
    var instrument : String
    var type : MusicianType
    
    //Initilializer (constructor)
    init(nameInit: String,ageInit: Int,instrumentInit:String, typeInit:MusicianType){
        name = nameInit
        age = ageInit
        instrument = instrumentInit
        type = typeInit
    }
    func sing() {
        print("nothing else matters")
    }
    
    
}
