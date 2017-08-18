//
//  ItemDetailsVC.swift
//  DreamList
//
//  Created by Billy Pierce on 8/17/17.
//  Copyright © 2017 Billy Pierce. All rights reserved.
//

import UIKit
import CoreData

class ItemDetailsVC: UIViewController,UIPickerViewDataSource, UIPickerViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    

    @IBOutlet weak var thumbImage: UIImageView!
    @IBOutlet weak var detailsField: UITextField!
    @IBOutlet weak var priceField: UITextField!
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var storePicker: UIPickerView!
    
    var stores = [Store]()
    
    var itemToEdit: Item?
    
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let topItem = self.navigationController?.navigationBar.topItem {
            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        }
        //set up picker
        storePicker.delegate = self
        storePicker.dataSource = self
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
//        let store = Store(context: context)
//        store.name = "Best Buy"
//        let store2 = Store(context: context)
//        store2.name = "Tesla"
//        let store3 = Store(context: context)
//        store3.name = "Fry Electronics"
//        let store4 = Store(context: context)
//        store4.name = "Target"
//        let store5 = Store(context: context)
//        store5.name = "Amazon"
//        let store6 = Store(context: context)
//        store6.name = "Walmart"
//        //store to core data
//        ad.saveContext()
        //get data from core data and add it to picker
        getStores()
        
        if itemToEdit != nil {
            loadItemData()
        }
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let store = stores[row]
        return store.name
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return stores.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //update when selected
    }
    
    func getStores() {
        let fetchRequest: NSFetchRequest<Store> = Store.fetchRequest()
        
        do {
            self.stores = try context.fetch(fetchRequest)
            self.storePicker.reloadAllComponents()
        } catch {
            //handle error
        }
    }

    @IBAction func savedPressed(_ sender: Any) {
        //insert object into manage object context
        //assign attributes
        //save to db
        
        //checks if we are updateing or making a new item
        //core data handles this for us!
        var item: Item!
        //make new image entity
        let picture = Image(context: context)
        picture.image = thumbImage.image
        //associate image to item
        
        
        if itemToEdit == nil {
            item = Item(context: context)
        } else {
            item = itemToEdit
        }
        item.toImage = picture

        
        if let title = titleField.text {
            item.title = title;
        }
        if let price = priceField.text {
            //convert string to double
            item.price = (price as NSString).doubleValue
        }
        if let details = detailsField.text {
            item.details = details
        }
        
        item.toStore = stores[storePicker.selectedRow(inComponent: 0)]
        ad.saveContext()
        
        _ = navigationController?.popViewController(animated: true)
        
    }
    
    func loadItemData(){
        if let item = itemToEdit {
            titleField.text = item.title
            priceField.text = "\(item.price)"
            detailsField.text = item.details
            thumbImage.image = item.toImage?.image as? UIImage
        
            if let store = item.toStore {
                var index = 0;
                repeat {
                    let s = stores[index]
                    if s.name == store.name {
                        storePicker.selectRow(index, inComponent: 0, animated: false)
                        break
                    }
                index += 1
                } while (index < stores.count)
            }
        }
        
    }
    
    @IBAction func deletePressed(_ sender: Any) {
        
        if itemToEdit != nil {
            context.delete(itemToEdit!)
            ad.saveContext()
        }
       _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func addImage(_ sender: Any) {
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            thumbImage.image = image
        }
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
}
