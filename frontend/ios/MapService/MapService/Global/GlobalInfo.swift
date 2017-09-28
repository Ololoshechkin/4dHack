//
//  GlobalInfo.swift
//  MapService
//
//  Created by Vadim on 28/09/2017.
//  Copyright © 2017 Vadim. All rights reserved.
//

import Foundation

class GlobalInfo {
    static var smsIsEnabled: Bool = false
    static var from: String = "my location"
    static var to: String = "return back"
    static var duration: Int = 180
    static var walkDuration: Int = 180
    static var budget: Int = 0
    static var options = [String: Any]()
    static var places = [String?]()
    static func addPlace(_ text: String = "") {
        places.append(text)
    }
    static func removePlace(at index: Int) {
        places.remove(at: index)
    }
}

let defaultOptions = ["Park", "WC", "bike stop", "bridge", "back on taxi"]

let showPlaces = ["Isaakievski sobor", "Nevskiy prospect",
                  "Hermitage", "Russian museum", "Mariinski theatre"]

let StasPhoneNumber = "+79818227869"

