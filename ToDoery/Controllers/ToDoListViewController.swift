//
//  ViewController.swift
//  ToDoery
//
//  Created by Denys Mashyr on 7/13/18.
//  Copyright © 2018 Denys Mashyr. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {
    
    var itemArray = [Item]()
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let newItem = Item()
        newItem.title = "Find Mike"
        itemArray.append(newItem)
        
        let newItem2 = Item()
        newItem2.title = "Buy Eggos"
        itemArray.append(newItem2)

        let newItem3 = Item()
        newItem3.title = "Destroy Demogorgon"
        itemArray.append(newItem3)
        
        //return Array data from defaults
        if let items =  defaults.array(forKey: "ToDoListArray") as? [Item] {
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
       
        let item = itemArray[indexPath.row]
        
        cell.textLabel?.text = item.title
        
        //Set the cell accessory type depend of item array data
        cell.accessoryType = item.done ? .checkmark : .none
//        if item.done == true {
//            cell.accessoryType = .checkmark
//        } else {
//            cell.accessoryType = .none
//        }
        
        return cell
    }
    
    //MARK - TableView Delegate Methods
    //Number of Selected Row
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        //print(itemArray[indexPath.row])
        
        //Set property of teh class in array after selection
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
//        if itemArray[indexPath.row].done == false {
//            itemArray[indexPath.row].done = true
//        } else {
//           itemArray[indexPath.row].done = false
//        }
        
        //Reload table vIew to update check mark
        tableView.reloadData()
        
        //Add checkmark when pressed or removed if already checkmark added
//        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
//            tableView.cellForRow(at: indexPath)?.accessoryType = .none
//        } else {
//            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
//        }
        
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
            let newItem = Item()
            newItem.title = textField.text!
            self.itemArray.append(newItem)

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

