//
//  TableViewController.swift
//  Todoey
//
//  Created by Amol Rai on 08/03/19.
//  Copyright © 2019 Rai Brothers. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var array = ["", "", ""]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = array[indexPath.row]
        return cell!
        
    }

    // TODO - Delegate Method
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .disclosureIndicator {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }
        else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .disclosureIndicator
        }
        
    }

    
    // TODO:- Added the bar button to add some item into todoey list
    @IBAction func addBarButtonPressed(_ sender: UIBarButtonItem) {
        
        var dataField = UITextField()
        
        let alert = UIAlertController(title: "Add", message: "", preferredStyle: .alert)
        alert.addAction(.init(title: "Add Item", style: .default) { (action) in
            self.array.append(dataField.text!)
            self.tableView.reloadData()
            
        })
        present(alert, animated: true, completion: nil)
        
        alert.addTextField { (uiTextField) in
        uiTextField.placeholder = "Write Your List"
            dataField = uiTextField
        }
    }
    
}
