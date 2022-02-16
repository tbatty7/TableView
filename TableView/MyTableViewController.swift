//
//  MyTableViewController.swift
//  TableView
//
//  Created by Timothy D Batty on 2/15/22.
//

import UIKit

class MyTableViewController: UITableViewController {

    private let model = ["One", "Two", "Three"]
       
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        model.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "mycell", for: indexPath)
        cell.textLabel?.text = model[indexPath.row]
                
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Value selected: \(model[indexPath.row])")
    }

}
