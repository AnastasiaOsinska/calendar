//
//  PopUpViewController.swift
//  calendar
//
//  Created by Anastasiya Osinskaya on 7/2/20.
//  Copyright © 2020 Anastasiya Osinskaya. All rights reserved.
//

import UIKit
import UserNotifications
import CoreData

protocol AddTask {
    func addTask(task: Task)
}

class PopUpViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate{
    
    @IBOutlet weak var popUpTitle: UILabel!
    @IBOutlet weak var noteTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var noteAction: UIButton!
    @IBOutlet var date: UITextField!
    
    var delegate: AddTask?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        noteTextField.delegate = self
        datePicker?.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(dateChanged), for: .valueChanged)
    }
    @objc func dateChanged(){
        getDataFromDatePicker()
    }
    
    func getDataFromDatePicker(){
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        date.text = formatter.string(from: datePicker.date)
    }
    @IBAction func cancelButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addNote(_ sender: Any) {
        datePicker.timeZone = NSTimeZone.local
        date.inputView = datePicker!
        datePicker.datePickerMode = .date
        let task = Task(name: noteTextField.text ?? "", date: datePicker.date)
        delegate?.addTask(task: task)
        dismiss(animated: true, completion: nil)
    }
    
    func createDatePicker(){
        let datePick = UIPickerView()
        datePick.delegate = self
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 10
    }
}

extension PopUpViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

