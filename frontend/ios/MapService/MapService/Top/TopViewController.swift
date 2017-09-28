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
        let token = topRoutes[indexPath.row].id
        print(token) // TODO server request
    }
    
}
