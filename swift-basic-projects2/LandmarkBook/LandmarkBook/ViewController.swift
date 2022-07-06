//
//  ViewController.swift
//  LandmarkBook
//
//  Created by Elıf on 16.04.2022.
//

import UIKit
//tableview icin 3 adim
// 1.class yanina UItable olarak yaz
//2. tableview.delegate = selflere esitle
//3. fonksiyonlari yaz

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var landmarkNames = [String]()
    var landmarkImages = [UIImage]()
    var chosenLandmarkNames = ""
    var chosenLandmarkImages = UIImage()
    
    
    @IBOutlet weak var tableView: UITableView!
    //ustune yazmak
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        
        //landmarkBook DATA
        
        //diziye kaydettik
        landmarkNames.append("Colosseum")
        landmarkNames.append("Great wall")
        landmarkNames.append("Kremlin")
        landmarkNames.append("Stonehenge")
        landmarkNames.append("Taj Mahal")
        //gorselleri kaydedecegimiz dizi
        landmarkImages.append(UIImage(named: "col.jpeg")!)
        landmarkImages.append(UIImage(named: "wall.jpeg")!)
        landmarkImages.append(UIImage(named: "kremlin.jpeg")!)
        landmarkImages.append(UIImage(named: "stone.jpeg")!)
        landmarkImages.append(UIImage(named: "taj.jpeg")!)
        
    }
    //yana kaydirarak silmek icin
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            landmarkNames.remove(at: indexPath.row)
            landmarkImages.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
        }
    }
    
    
    
    
    //bu iki fonksiyonu eklersek Uitabledelegate ve data source kullanabiliriz.
    //kac sira olacak ve icinde ne olacak
    //ne gostericez hucrelerde
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = landmarkNames[indexPath.row]
        return cell
    }
    //kac tane gostericez
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landmarkNames.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        chosenLandmarkNames = landmarkNames[indexPath.row]
        chosenLandmarkImages = landmarkImages[indexPath.row]
        
        performSegue(withIdentifier: "toimageViewController", sender: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toimageViewController " {
            let destinationVC = segue.destination as! imageViewController
            destinationVC.selectedlandmarkName = chosenLandmarkNames
            destinationVC.selectedlandmarkImage = chosenLandmarkImages
            
        }
    }

}

