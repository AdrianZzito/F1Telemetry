//
//  Model.swift
//  F1Telemetry
//
//  Created by Adrián Castilla on 22/2/23.
//

import Foundation

struct Driver: Identifiable, Hashable {
    var id: String {
        return name + String(year) + team
    }
    var name: String
    var year: Int
    var team: String
    
    init(name: String, year: Int, team: String) {
        self.name = name
        self.year = year
        self.team = team
    }
    
}
