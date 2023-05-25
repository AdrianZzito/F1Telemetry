//
//  ServerStatusView.swift
//  Telemetry Of Champions
//
//  Created by Adrián Castilla on 27/2/23.
//

import SwiftUI

enum ServerStatus {
    case fullyOperative
    case down
}

struct ServerStatusView: View {
    
    @State var serverStatus = ServerStatus.fullyOperative
    var body: some View {
        
        HStack {
            
            Circle()
                .frame(width: 20)
                .foregroundColor(serverStatus == .fullyOperative ? Color.green : Color.red)
                .padding(.trailing)
            
            Text("Server status: \(serverStatus == .fullyOperative ? "Fully Operative" : "Down")")
                .font(.custom("Formula1", size: 15))
            
        }
        
    }
}

struct ServerStatusView_Previews: PreviewProvider {
    static var previews: some View {
        ServerStatusView()
    }
}
