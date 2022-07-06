//
//  DetailsVC.swift
//  ArtBookProject
//
//  Created by Elıf on 19.04.2022.
//

import UIKit
import CoreData

class DetailsVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var artistText: UITextField!
    @IBOutlet weak var yearText: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    var chosenPainting = ""
    var chosenPaintingId : UUID?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    //tiklanilinca bilgileri acsin verileri aktarsin
        
        if chosenPainting != "" {
            
            saveButton.isHidden = true //resimleri sectikten sonra bilgileri gordugumuzde save butonunu kapadik.
            //core data
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Paintings")
            let idString = chosenPaintingId?.uuidString
            fetchRequest.predicate = NSPredicate(format: "id = %@", idString!) //idsi .. olani bana getir
            fetchRequest.returnsObjectsAsFaults = false
            
            do {
                let results = try context.fetch(fetchRequest)
                
                if results.count > 0 {
                    
                    for result in results as! [NSManagedObject] {
                        
                        if let name = result.value(forKey: "name") as? String {
                            nameText.text = name
                        }
                        
                        if let artist = result.value(forKey: "artist") as? String {
                            artistText.text = artist
                        }
                        
                        if let year = result.value(forKey: "year") as? Int {
                            yearText.text = String(year) //inti stringe cevirdik
                        }
                        
                        if let imageData = result.value(forKey: "image") as? Data {
                            let image = UIImage(data: imageData)
                            imageView.image = image
                        }
                    }
                }
                
            } catch {
                    print("error")
            }
            
        } else{
            saveButton.isHidden = false
            saveButton.isEnabled = false //resim koymadigimiz surece tiklanamasin
            nameText.text = ""
            artistText.text = ""
            yearText.text = ""
        }

        
        //RECOGNIZERS
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(gestureRecognizer)
        
        imageView.isUserInteractionEnabled = true //kullanici gorsele tiklasin mi
        let imageTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(selectImage))
        imageView.addGestureRecognizer(imageTapRecognizer)
    }
    
    @objc func selectImage(){
        
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary //resmi nereden sececegi
        picker.allowsEditing = true //resmi kesip zoomlayip koyabilsin diye
        present(picker, animated: true, completion: nil) //tikladigimda kutuphaneye goturme islemi tamamlanir
        
    }
    //resmi sectikten sonra ne yapmasi gerektigi icin
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        imageView.image = info[.originalImage] as? UIImage //Belki kullanici resim secmez geri doner o yuzden as! yapamayiz
        saveButton.isEnabled = true //resim ekleyince buton aktif olsun
        self.dismiss(animated: true, completion: nil)
    
    }
    
    @objc func hideKeyboard() {
        
        view.endEditing(true)
    }

    @IBAction func saveButtonClicked(_ sender: Any) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate //APPDELEGATE degisken olarak tanimladik burda
        let context = appDelegate.persistentContainer.viewContext
        
        //contexte ne koyacagimizi soyluyoruz
        let newPainting = NSEntityDescription.insertNewObject(forEntityName: "Paintings", into: context)
        
        // ATTRIBUTES
        
        newPainting.setValue(nameText.text!, forKey: "name")
        newPainting.setValue(artistText.text!, forKey: "artist")
        
        if let year = Int(yearText.text!) {
            newPainting.setValue(year, forKey: "year")
        }
        
        newPainting.setValue(UUID(), forKey: "id")
        
        let data = imageView.image!.jpegData(compressionQuality: 0.5)
        
        newPainting.setValue(data, forKey: "image")
        
        do {
            try context.save()
            print("success")
        }catch{
            print("error")
        }
        
        NotificationCenter.default.post(name: NSNotification.Name("newData"), object: nil)
        self.navigationController?.popViewController(animated: true) //ekledikten sonra geri gitmek icin
        
        
    }
    
}

