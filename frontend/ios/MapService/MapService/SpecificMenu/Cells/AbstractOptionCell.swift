//
//  AbstractOptionCell.swift
//  MapService
//
//  Created by Vadim on 28/09/2017.
//  Copyright © 2017 Vadim. All rights reserved.
//

import Foundation
import UIKit

open class AbstractOptionCell: UITableViewCell {
    
    var parentTableView: SpecialMenuVC? = nil
    
    open func getName() -> String {
        return "none"
    }
    
    open func getData() -> Any {
        return "none"
    }
    
    open func update() {
        GlobalInfo.options[getName()] = getData()
    }
    
}

open class AbstractSpecificOptionCell: AbstractOptionCell {
    
    open func getMap() -> [String: Any] {
        return [:]
    }
    
    override open func getData() -> Any {
        return getMap()
    }
    
}

open class AbstractDefaultOptionCell: AbstractOptionCell {
    
    open func isChosen() -> Bool {
        return false
    }
    
    override open func getData() -> Any {
        return isChosen()
    }
    
}
