//
//  main.swift
//  musicianClass
//
//  Created by Elıf on 16.04.2022.
//

import Foundation

let james = Musicians(nameInit: "James", ageInit: 50, instrumentInit: "Guitar", typeInit: .Vocalist)
print(james.age)
print(james.type)
james.sing()

let kirk = superMusicians(nameInit: "Kirk", ageInit: 55, instrumentInit: "Guitar", typeInit:  .LeadGuitar)
//kirk.sing()

