//
//  CreditView.swift
//  Telemetry Of Champions
//
//  Created by Adrián Castilla on 2/3/23.
//

import SwiftUI

struct CreditView: View {
    var body: some View {
        
        ZStack {
            
            Rectangle()
                .frame(width: 60, height: 30)
                .cornerRadius(20, corners: .allCorners)
                .foregroundColor(.gray)
            
            Text("1")
                .font(.custom("Formula1", size: 15))
            
        }
        
    }
}

struct CreditView_Previews: PreviewProvider {
    static var previews: some View {
        CreditView()
    }
}
