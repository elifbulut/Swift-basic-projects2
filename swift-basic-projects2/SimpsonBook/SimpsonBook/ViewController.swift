//
//  ViewController.swift
//  SimpsonBook
//
//  Created by Elıf on 19.04.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var mySimpsons = [Simpson]()
    var chosenSimpson : Simpson?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        
        
        //simpson objects
        //objelerimizi olusturduk
        
        let homer = Simpson(simpsonName: "Homer Simpson", simpsonJob: "Nuclear Safety", simpsonImage: UIImage(named: "homer")!)
        
        let maggie = Simpson(simpsonName: "Maggie Simpson", simpsonJob: "Baby", simpsonImage: UIImage(named: "maggie")!)
        
        let lisa = Simpson(simpsonName: "Lisa Simpson", simpsonJob: "Student", simpsonImage: UIImage(named: "lisa")!)
    
        let bart = Simpson(simpsonName: "Bart Simpson", simpsonJob: "brother", simpsonImage: UIImage(named: "bart")!)
    
        //objelerimizi diziye yerlestirdik
        mySimpsons.append(homer)
        mySimpsons.append(maggie)
        mySimpsons.append(lisa)
        mySimpsons.append(bart)
        
    }
    //kac adet row olacagini yaziyoruz.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mySimpsons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = mySimpsons[indexPath.row].name // ONEMLI!!!!! isimleri gprmek istiyoruz ilk sayfa icin
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenSimpson = mySimpsons[indexPath.row]
        self.performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC"{
            let destinationVC = segue.destination as! detailsVC // gidilecek viewcontrolu detailsvc 
            destinationVC.selectedSimpson = chosenSimpson
        
        }
    }
    
}

