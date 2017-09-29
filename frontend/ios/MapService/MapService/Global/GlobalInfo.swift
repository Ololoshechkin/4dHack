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
    static var from: String = "my current location"
    static var to: String = "return back"
    static var duration: Int = 180
    static var walkDuration: Int = 180
    static var budget: Int = 0
    static var options = [String: Any]()
    static var places = [String?]()
    static var currentLocation: String = "0,0"
    static func addPlace(_ text: String = "") {
        places.append(text)
    }
    static func removePlace(at index: Int) {
        places.remove(at: index)
    }
    static func getFrom() -> String {
        return from == "my current location" ? currentLocation : from
    }
    static func getTo() -> String {
        return from == "my current location" ? currentLocation : from
    }
}

let defaultOptions = ["Park", "WC", "bike stop", "bridge", "back on taxi"]

let showPlaces = ["Isaakievski sobor", "Nevskiy prospect",
                  "Hermitage", "Russian museum", "Mariinski theatre", "Zinger's house"]

let StasPhoneNumber = "+79818227869"

let hashtags = ["for walking", "for girlfrend", "for weddings", "for bikers", "for tourists", "for photographers"]

