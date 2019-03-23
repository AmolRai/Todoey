//
//  TableViewController.swift
//  Todoey
//
//  Created by Amol Rai on 08/03/19.
//  Copyright © 2019 Rai Brothers. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var itemArray = [Item]()
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newItem = Item()
        newItem.title = "Amit"
        itemArray.append(newItem)
        
        let newItem1 = Item()
        newItem1.title = "Amol"
        itemArray.append(newItem1)
        
        let newItem3 = Item()
        newItem3.title = "Nishant"
        itemArray.append(newItem3)
        
        if let items = UserDefaults.standard.array(forKey: "TodoList") as? [Item] {
            itemArray = items
        }
       
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
            
          self.defaults.setValue(self.itemArray, forKey: "TodoList")
            
            self.tableView.reloadData()
            
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Add Your List"
            dataField = alertTextField
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
        }
    }
    

