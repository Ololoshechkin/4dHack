//
//  ButtonsCell.swift
//  MapService
//
//  Created by Vadim on 28/09/2017.
//  Copyright © 2017 Vadim. All rights reserved.
//

import Foundation
import UIKit

class ButtonsCell: AbstractOptionCell {
    
    @IBAction func add(_ sender: Any) {
        let alert = UIAlertController(title: "add new place", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "type place mannually...", style: .default) { _ in
            self.parentTableView?.addCell()
        })
        showPlaces.forEach { showplace in
            alert.addAction(UIAlertAction(title: showplace, style: .default) { _ in
                self.parentTableView?.addCell(with: showplace)
            })
        }
        parentTableView?.present(alert, animated: true)
    }
    
    @IBAction func go(_ sender: Any) {
        if (GlobalInfo.smsIsEnabled) {
            parentTableView?.sendBySms()
        } else {
            // TODO
        }
    }
    
}
