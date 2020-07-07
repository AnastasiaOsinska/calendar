//
//  ViewController.swift
//  calendar
//
//  Created by Anastasiya Osinskaya on 7/1/20.
//  Copyright © 2020 Anastasiya Osinskaya. All rights reserved.
//

import UIKit
import CoreData

class CategoryViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var categories : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    @IBAction func addCategory(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Add Category", message: "", preferredStyle: .alert)
               alert.addTextField { (UITextField) in
               }
               alert.addAction(UIAlertAction(title: "Add", style: .default, handler: { (UIAlertAction) in
                   let content = alert.textFields![0] as UITextField
                   self.categories.append(content.text!)
                   self.tableView.reloadData()
               }))
               alert.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: nil))
               self.present(alert, animated: true, completion: nil)
           }
}

extension CategoryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    performSegue(withIdentifier: "goToItems", sender: self)
    }
}

extension CategoryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = categories[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
           
           if editingStyle == .delete {
               categories.remove(at: indexPath.row)
           }
           tableView.reloadData()
       }
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           if segue.identifier == "goToItems" {
            _ = segue.destination as! ItemViewController
        
               }
}
}

