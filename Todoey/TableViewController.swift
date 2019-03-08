//
//  TableViewController.swift
//  Todoey
//
//  Created by Amol Rai on 08/03/19.
//  Copyright © 2019 Rai Brothers. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    let array = ["MarkFacebook", "Larry Page", "Google"]
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

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 100
    }

}
