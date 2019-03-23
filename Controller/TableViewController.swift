//
//  TableViewController.swift
//  Todoey
//
//  Created by Amol Rai on 08/03/19.
//  Copyright © 2019 Rai Brothers. All rights reserved.
//

import UIKit
import CoreData

class TableViewController: UITableViewController {

    var itemArray = [Item]()
    
    let filePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Item.plist")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        loadData()
//
//        if let items = UserDefaults.standard.array(forKey: "TodoList") as? [Item] {
//            itemArray = items
//        }
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        let item = itemArray[indexPath.row]
        
        cell?.textLabel?.text = item.title
        
        // Ternary operator ==>
        // value = condition ? valueIfTrue : valueIfFalse
        
        cell?.accessoryType = item.done ? .checkmark : .none
    
        
        return cell!
    }

    // TODO - Delegate Method
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
        savingData()
        
        tableView.reloadData()
      
        tableView.deselectRow(at: indexPath, animated: true)
        
    }

    // TODO:- Added the bar button to add some item into todoey list
    @IBAction func addBarButtonPressed(_ sender: UIBarButtonItem) {

        var dataField = UITextField()
        
        let alert = UIAlertController(title: "Add", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction.init(title: "Add Item", style: .default) { (action) in
         
            let newItem = Item()
            newItem.title = dataField.text!
            
            self.itemArray.append(newItem)
            
            self.savingData()
            
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Add Your List"
            dataField = alertTextField
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
        }
    
    // TODO: Creating a new plist file to saving the data
    
    func savingData() {
        
        let data = PropertyListEncoder()
        do {
       let persitentData = try data.encode(itemArray)
          try persitentData.write(to: filePath!)
        }
        catch {
            print("Error while persisting the data\(error)")
        }
        tableView.reloadData()
    }
    
    func loadData() {
        
        if let data = try? Data(contentsOf: filePath!) {
             let decoder = PropertyListDecoder()
        
        do {
            itemArray = try decoder.decode([Item].self, from: data)
        }
        catch {
            print("erroe while loading data\(error)")
        }
        
    }
        
    }
    
}
    

