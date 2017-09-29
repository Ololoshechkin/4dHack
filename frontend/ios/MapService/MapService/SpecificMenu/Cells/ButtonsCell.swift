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
    
    private func uncheckedGo() {
        let location = parentTableView?.locationManager.location!.coordinate
        GlobalInfo.currentLocation = "\(location!.latitude),\(location!.longitude)"
        if (GlobalInfo.smsIsEnabled) {
            parentTableView?.sendBySms()
        } else {
            UIApplication.shared.open(URL(
                string: APIWorker.getLink())!,
                options: [:],
                completionHandler: { (succ: Bool) in print("Complete! Success? \(succ)")
            })
        }
    }
    
    private func caffesEnabled() -> Bool {
        print((GlobalInfo.options["caffe"] as! [String: Any])["chosen"] as! Bool)
        return (GlobalInfo.options["caffe"] as! [String: Any])["chosen"] as! Bool
    }
    
    @IBAction func go(_ sender: Any) {
        if (GlobalInfo.duration >= 60 * 4 && !caffesEnabled()) {
            let alert = UIAlertController(title: "Mind caffes", message: "Your walk takes more than 4 hours. Having a meal strongly recomended!", preferredStyle: .actionSheet)
            alert.addAction(UIAlertAction(title: "add caffe", style: .default) { _ in })
            alert.addAction(UIAlertAction(title: "go anyway!", style: .default) { _ in
                self.uncheckedGo()
            })
            parentTableView?.present(alert, animated: true)
        } else if ((GlobalInfo.options["caffe"] as! [String: Any])["time"] as! String == "null") {
            let alert = UIAlertController(title: "Enter caffe time", message: nil, preferredStyle: .actionSheet)
            alert.addAction(UIAlertAction(title: "dismiss", style: .default) { _ in })
            parentTableView?.present(alert, animated: true)
        } else {
            self.uncheckedGo()
        }
    }
    
}
