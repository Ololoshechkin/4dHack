//
//  HTCell.swift
//  MapService
//
//  Created by Vadim on 29/09/2017.
//  Copyright © 2017 Vadim. All rights reserved.
//

import Foundation
import UIKit

class HTCell: UITableViewCell {
    
    var parentVC: HashtagVC? = nil
    
    @IBOutlet weak var hashtag: UILabel!
    
    @IBAction func `switch`(_ sender: Any) {
        parentVC?.changeFilter(for: hashtag.text!)
    }
    
    
    
}
