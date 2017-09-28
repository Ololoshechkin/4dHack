//
//  ShopCell.swift
//  MapService
//
//  Created by Vadim on 28/09/2017.
//  Copyright © 2017 Vadim. All rights reserved.
//

import Foundation
import UIKit

class ShopCell: AbstractSpecificOptionCell {
    
    let types = ["food", "clothes"]
    
    @IBOutlet weak var type: UISegmentedControl!
    
    @IBOutlet weak var chosen: UISwitch!
    
    @IBAction func typeChanged(_ sender: Any) {
        update()
    }
    
    @IBAction func shosenChanged(_ sender: Any) {
        update()
    }
    
    override func getName() -> String {
        return "Shop"
    }
    
    override func getMap() -> [String : Any] {
        return [
            "type " : types[type.selectedSegmentIndex],
            "chosen": chosen.isOn
        ]
    }
    
    
}
