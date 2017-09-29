//
//  GlobalMethods.swift
//  MapService
//
//  Created by Vadim on 28/09/2017.
//  Copyright © 2017 Vadim. All rights reserved.
//

import Foundation

func getMiddle(_ minV: Int, _ maxV: Int) -> Int {
    return minV + (maxV - minV) / 2
}

func getCurrentTime() -> (h: Int, m: Int) {
    let date = Date()
    let calendar = Calendar.current
    return (h: calendar.component(.hour, from: date),
            m: calendar.component(.minute, from: date))
}

func getRelativeTime(for time: String) -> Float {
    let chars = time.characters
    var (h, m) = ("", "")
    var ok = false
    chars.forEach { c in
        if (c == ":") {
            ok = true
        } else {
            if (!ok) {h.append(c)}
            else {m.append(c)}
        }
    }
    print("h = \(h), m = \(m)")
    let (ch, cm) = getCurrentTime()
    print("ch = \(ch), m = \(cm)")
    return 60.0 * Float(Int(h)! - ch) + Float(Int(m)! - cm)
}
