//
//  ItemViewController.swift
//  calendar
//
//  Created by Anastasiya Osinskaya on 7/2/20.
//  Copyright © 2020 Anastasiya Osinskaya. All rights reserved.
//

import UIKit
import CoreData

class ItemViewController: UIViewController, AddTask, UITableViewDelegate, CheckButton {
    
    @IBOutlet var tableV: UITableView!
    var tasks : [Task] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableV.dataSource = self
        tableV.delegate = self
    }
    
    @IBAction func addItem(_ sender: Any) {
        performSegue(withIdentifier: "showDatePopUp", sender: self)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
extension ItemViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Item", for: indexPath) as! ItemCell
        cell.dateLabel.text = tasks[indexPath.row].date.description(with: .current)
        cell.cellNameLabel.text = tasks[indexPath.row].name
        if tasks[indexPath.row].checked {
            cell.checkButtonOutlet.setBackgroundImage(UIImage.init(named: "14946"), for: UIControl.State.normal)
        }else{
            cell.checkButtonOutlet.setBackgroundImage(UIImage.init(named: "pngwave"), for: UIControl.State.normal)
        }
        
        cell.delegate = self
        cell.indexP = indexPath.row
        cell.tasks = tasks
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            tasks.remove(at: indexPath.row)
        }
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDatePopUp"{
            let vc = segue.destination as! PopUpViewController
            vc.delegate = self
        }
    }
    
    func addTask(task: Task) {
        tasks.append(task)
        tableV.reloadData()
        
    }
    
    func checkButton(checked: Bool, index: Int) {
        tasks[index].checked = checked
        tableV.reloadData()
    }
}

class Task {
    var name = ""
    var checked = false
    var date: Date
    
    init(name: String, date: Date) {
        self.name = name
        self.date = date
    }
}
