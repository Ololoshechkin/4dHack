//
//  SpecialMenuVC.swift
//  MapService
//
//  Created by Vadim on 28/09/2017.
//  Copyright © 2017 Vadim. All rights reserved.
//

import Foundation
import UIKit
import MessageUI
import CoreLocation

class SpecialMenuVC: UITableViewController, CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locValue:CLLocationCoordinate2D = manager.location!.coordinate
        print("locations = \(locValue.latitude) \(locValue.longitude)")
    }
    
    override func viewDidLoad() {
        self.hideKeyboardWhenTappedAround()
        GlobalInfo.options["caffe"] = ["type": "restaurant", "chosen" : true, "time": "null"]
        GlobalInfo.options["shop"] = ["type " : "food", "chosen": false]
        defaultOptions.forEach { option in
            GlobalInfo.options[option] = false
        }
        locationManager.delegate = self;
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "default places" :
            section == 1 ? "additional places" : nil
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 2 + defaultOptions.count
            : section == 1 ? GlobalInfo.places.count
            : 1
    }
    
    private func abstractCell(for indexPath: IndexPath, byId id: String) -> AbstractOptionCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: id,
            for: indexPath
        ) as! AbstractOptionCell
        cell.parentTableView = self
        return cell
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch (indexPath.section) {
        case 0:
            switch(indexPath.row) {
            case 0:
                return abstractCell(for: indexPath,
                                    byId: "Caffe") as! CaffeCell
            case 1:
                return abstractCell(for: indexPath,
                                    byId: "Shop") as! ShopCell
            default:
                let cell = abstractCell(for: indexPath,
                                        byId: "Option") as! DefaultOptionCell
                cell.optionLabel.text = defaultOptions[indexPath.row - 2]
                return cell
            }
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "Custom", for: indexPath) as! CustomPlaceCell
            if (cell.index == nil) {
                cell.index = GlobalInfo.places.count - 1
            }
            cell.placeTextbox.text = GlobalInfo.places[cell.index!]
            return cell
        default:
            return abstractCell(for: indexPath,
                                byId: "Button") as! ButtonsCell
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch(indexPath.section) {
        case 0:
            switch(indexPath.row) {
            case 0:
                return 90
            case 1:
                return 90
            default:
                return 60
            }
        case 1:
            return 60
        default:
            return 90
        }
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return indexPath.section == 1
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.delete) {
            removeCell(at: indexPath)
        }
    }
    
    func addCell(with text: String = "") {
        GlobalInfo.addPlace(text)
        tableView.reloadData()
    }
    
    func removeCell(at indexPath: IndexPath) {
        let index = (tableView.cellForRow(at: indexPath)
            as! CustomPlaceCell).index!
        GlobalInfo.removePlace(at: index)
        tableView.reloadData()
    }
    
    
}
