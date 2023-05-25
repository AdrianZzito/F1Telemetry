//
//  PreviousGenerationsRow.swift
//  Telemetry Of Champions
//
//  Created by Adrián Castilla on 25/2/23.
//

import SwiftUI

struct PreviousGenerationsRow: View {
    
    @State var year: Int
    @State var grandPrix: String
    @State var session: String
    @State var driver1: String
    @State var driver2: String
    
    var body: some View {
        Text("\(String(year)) \(grandPrix) GP \(session) - \(driver1) vs \(driver2)")
            .font(.custom("Formula1", size: 15))
    }
}

struct PreviousGenerationsRow_Previews: PreviewProvider {
    static var previews: some View {
        PreviousGenerationsRow(year: 2022, grandPrix: "Bahrain", session: "Race", driver1: "VER", driver2: "LEC")
    }
}
