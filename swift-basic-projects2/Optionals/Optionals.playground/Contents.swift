import UIKit

//! kesin eminlik
//? opsiyonel olabilirde olmayabilirde

var myName : String?

myName?.uppercased()

var myAge = "f"

var myInteger = (Int(myAge) ?? 0) * 5

if let myNumber = Int(myAge) {
    print(myNumber * 5)
}else {
    print("wrong")
    
}
