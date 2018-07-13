//
//  ViewController.swift
//  ToDoery
//
//  Created by Denys Mashyr on 7/13/18.
//  Copyright © 2018 Denys Mashyr. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {

    
   
    
    let itemArray = ["FindMike", "Buy Eggos", "Destroy Demogorgon"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }

    //MARK - Tableview Datasource Methods
    //Number of Raws
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    //Show Array in Table View
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
    }
    
    //MARK - TableView Delegate Methods
    //Number of Selected Row
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

  //      print(itemArray[indexPath.row])
        
        //Add checkmark when pressed or removed if already checkmark added
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        //Remove animation after selection
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
}

