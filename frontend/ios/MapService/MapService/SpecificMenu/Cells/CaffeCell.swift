//
//  CaffeCell.swift
//  MapService
//
//  Created by Vadim on 28/09/2017.
//  Copyright © 2017 Vadim. All rights reserved.
//

import Foundation
import UIKit

class CaffeCell: AbstractSpecificOptionCell {
    
    let types = ["restaurant", "fastfood", "bar"]
    
    @IBOutlet weak var typeSwitcher: UISegmentedControl!
    
    @IBAction func typeSwitched(_ sender: Any) {
        update()
    }
    
    @IBOutlet weak var timeTextbox: UITextField!
    
    @IBAction func updateTime(_ sender: Any) {
        update()
    }
    
    @IBOutlet weak var chosen: UISwitch!
    
    override func getName() -> String {
        return "caffe"
    }
    
    override func getMap() -> [String: Any] {
        return [
            "type": types[typeSwitcher.selectedSegmentIndex],
            "chosen" : chosen.isOn,
            "time": timeTextbox.text ?? "null"
        ]
    }
    
}
