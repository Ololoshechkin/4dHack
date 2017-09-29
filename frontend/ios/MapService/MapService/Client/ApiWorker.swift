//
//  ApiWorker.swift
//  MapService
//
//  Created by Vadim on 28/09/2017.
//  Copyright © 2017 Vadim. All rights reserved.
//

import Foundation
import MessageUI
import CoreLocation

class APIWorker {
    
    class func getTopRoutes(_ hashTags: [String]) -> [TopRoute] {
        return testRoutes
    }
    
    class func getLink() -> String {
        var url = "http://192.168.1.163:5000?"
        url += "start=\(GlobalInfo.getFrom())&"
        url += "finish=\(GlobalInfo.getTo())&"
        url += "duration=\(GlobalInfo.duration)&"
        url += "duration_on_foot=\(GlobalInfo.walkDuration)&"
        url += "money=\(GlobalInfo.budget)&"
        url += "temp_place=\(GlobalInfo.places.map { s in s! }.joined(separator: ","))"
        if (GlobalInfo.options["shop"] != nil) {
            let shopOption = GlobalInfo.options["shop"] as! [String: Any]
            if ((shopOption["chosen"] as! Bool) == true) {
                url += (GlobalInfo.places.isEmpty ? "" : ",") + "\(shopOption["type"] as! String) shop"
            }
        }
        GlobalInfo.options.forEach { (key, value) in
            if (value is Bool && (value as! Bool)) {
                url += (GlobalInfo.places.isEmpty ? "" : ",") + "\(key)"
            }
        }
        if (GlobalInfo.options["caffe"] != nil) {
            let caffeOption = GlobalInfo.options["caffe"] as! [String: Any]
            if ((caffeOption["chosen"] as! Bool) == true) {
                url += "&cafe_type=\(caffeOption["type"] as! String)"
                url += "&time_cafe=\(getRelativeTime(for: caffeOption["time"] as! String))"
            }
        }
        print(url)
        return url
    }
    
}
