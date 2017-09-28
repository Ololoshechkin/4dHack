//
//  HashtagVC.swift
//  MapService
//
//  Created by Vadim on 29/09/2017.
//  Copyright © 2017 Vadim. All rights reserved.
//

import Foundation
import UIKit

class HashtagVC: UITableViewController {
    
    var searchFilter = [String: Bool]()
    
    func changeFilter(for name: String) {
        searchFilter[name] = !searchFilter[name]!
    }
    
    override func viewDidLoad() {
        hashtags.forEach { h in searchFilter[h] = true }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 1 : hashtags.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (indexPath.section == 0) {
            return tableView.dequeueReusableCell(
                withIdentifier: "HTButton",
                for: indexPath) as! HTButton
        }
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "HTCell",
            for: indexPath) as! HTCell
        cell.parentVC = self
        cell.hashtag.text = hashtags[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var chosen = [String]()
        hashtags.forEach { h in
            if (searchFilter[h] == true) {
                chosen.append(h)
            }
        }
        print("chosen: \(chosen)")
        (segue.destination as! TopViewController).topRoutes = APIWorker.getTopRoutes(chosen)
    }
}
