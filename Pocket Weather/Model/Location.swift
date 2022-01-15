//
//  Location.swift
//  Pocket Weather
//
//  Created by Geoffrey Johnson on 1/8/22.
//

import Foundation

struct Location: Codable {
    var name: String
    var state: String
    var country: String
    var lat: Double
    var lon:Double
}
