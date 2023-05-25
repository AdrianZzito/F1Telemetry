//
//  EasterEggView.swift
//  Telemetry Of Champions
//
//  Created by Adrián Castilla on 1/3/23.
//

import SwiftUI

struct EasterEggView: View {
    var body: some View {
        VStack {
            
            Image("astonmartin2023")
                .resizable()
                .frame(width: 175, height: 55)
                .clipped()
            
            Text("33")
                .font(.custom("Formula1", size: 20))
            
        }
    }
}

struct EasterEggView_Previews: PreviewProvider {
    static var previews: some View {
        EasterEggView()
    }
}
