//
//  CustomPlaceCell.swift
//  MapService
//
//  Created by Vadim on 28/09/2017.
//  Copyright © 2017 Vadim. All rights reserved.
//

import Foundation
import UIKit

class CustomPlaceCell: AbstractOptionCell {
    
    var index: Int? = nil
    
    @IBOutlet weak var placeTextbox: UITextField!
    
    @IBAction func placeTextboxChanged(_ sender: Any) {
        GlobalInfo.places[index!] = placeTextbox.text
    }
    
}
