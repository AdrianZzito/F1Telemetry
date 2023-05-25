//
//  PreviousGenerationsModel.swift
//  Telemetry Of Champions
//
//  Created by Adrián Castilla on 25/2/23.
//

import Foundation

struct Telemetry: Encodable, Decodable, Identifiable {
    var id: String {
        return String(year) + grandPrix + session + driver1 + driver2
    }
    var year: Int
    var grandPrix: String
    var session: String
    var driver1: String
    var driver2: String
    
    init(year: Int, grandPrix: String, session: String, driver1: String, driver2: String) {
        self.year = year
        self.grandPrix = grandPrix
        self.session = session
        self.driver1 = driver1
        self.driver2 = driver2
    }
}
