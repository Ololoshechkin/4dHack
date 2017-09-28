//
//  DefaultOptionCell.swift
//  MapService
//
//  Created by Vadim on 28/09/2017.
//  Copyright © 2017 Vadim. All rights reserved.
//

import Foundation
import UIKit

class DefaultOptionCell: AbstractDefaultOptionCell {
    
    
    @IBOutlet weak var optionLabel: UILabel!
    
    @IBOutlet weak var chosen: UISwitch!
    
    @IBAction func chosenChanged(_ sender: Any) {
        update()
    }
    
    override func getName() -> String {
        return optionLabel.text!
    }
    
    override func isChosen() -> Bool {
        return chosen.isOn
    }
    
    
    
    
    
}
