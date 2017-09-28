//
//  TopRoute.swift
//  MapService
//
//  Created by Vadim on 28/09/2017.
//  Copyright © 2017 Vadim. All rights reserved.
//

import Foundation

class TopRoute {
    let id: String
    let start: String
    let end: String
    init(id: String, start: String, end: String) {
        (self.id, self.start, self.end) = (id, start, end)
    }
}
