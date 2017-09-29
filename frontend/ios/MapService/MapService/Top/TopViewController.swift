//
//  TopViewController.swift
//  MapService
//
//  Created by Vadim on 28/09/2017.
//  Copyright © 2017 Vadim. All rights reserved.
//

import Foundation
import UIKit

class TopViewController: UITableViewController {
    
    var topRoutes = [TopRoute]()
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topRoutes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "TopCell",
            for: indexPath
        ) as! TopRouteCell
        cell.routeStart.text = topRoutes[indexPath.row].start
        cell.routeEnd.text = topRoutes[indexPath.row].end
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let url = "http://192.168.1.163:5000?huy=59.935780,30.325893,59.934204,30.324592,59.938078,30.317295,59.939833,30.314593,59.942948,30.252050"
        UIApplication.shared.open(URL(string: url)!,
            options: [:],
            completionHandler: { (succ: Bool) in print("Complete! Success? \(succ)")
        })
    }
    
}
