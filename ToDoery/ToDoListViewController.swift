//
//  ViewController.swift
//  ToDoery
//
//  Created by Denys Mashyr on 7/13/18.
//  Copyright © 2018 Denys Mashyr. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {
    
    var itemArray = ["FindMike", "Buy Eggos", "Destroy Demogorgon"]
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        //return Array data from defaults
        if let items =  defaults.array(forKey: "ToDoListArray") as? [String] {
            itemArray = items
        }
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
    
    //MAKR - Add New Item
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        //local variable to get text from Add New item Alert Text
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            //what happen once the user clicks the Add Item Buttin on our Alert
            
            //add new Item to array to display in list view
            self.itemArray.append(textField.text!)

            
            //Save array to the user defaults
            self.defaults.set(self.itemArray, forKey: "ToDoListArray")
            
            //reload list view after addig new item
            self.tableView.reloadData()
            
            print("Success")
            print(textField.text!)
        }
        
        //add text field to alert
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create New Item"
            textField = alertTextField
        }
        
        
        //add action (when pressed the button to add action)
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
   
    }
    
}

