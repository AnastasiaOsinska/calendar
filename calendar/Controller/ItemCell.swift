//
//  ItemCell.swift
//  calendar
//
//  Created by Anastasiya Osinskaya on 7/6/20.
//  Copyright © 2020 Anastasiya Osinskaya. All rights reserved.
//

import Foundation
import UIKit

protocol CheckButton {
    func checkButton(checked: Bool, index: Int)
}

class ItemCell: UITableViewCell {
    
    @IBOutlet var cellNameLabel: UILabel!
    @IBOutlet var checkButtonOutlet: UIButton!
    @IBOutlet var dateLabel: UILabel!
   
    @IBAction func ckeckButtonAction(_ sender: Any) {
        if tasks![indexP!].checked {
            delegate?.checkButton(checked: false, index: indexP!)
        } else {
            delegate?.checkButton(checked: true, index: indexP!)
        }
    }
   
    var delegate: CheckButton?
    var indexP: Int?
    var tasks: [Task]?
    
}
    
