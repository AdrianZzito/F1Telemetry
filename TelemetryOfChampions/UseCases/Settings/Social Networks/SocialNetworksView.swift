//
//  SocialNetworksView.swift
//  Telemetry Of Champions
//
//  Created by Adrián Castilla on 1/3/23.
//

import SwiftUI

struct SocialNetworksView: View {
    
    @State var socialNetwork = "Website"
    
    var body: some View {
        
        Link(destination: URL(string: "https://telemetryofchampions.super.site")!) {
            HStack {
                
                Image(systemName: "globe")
                    .foregroundColor(.red)
                    .font(.title2)
                    .padding(.trailing)
                
                Text("settings.section.socialnetwork.website")
                    .font(.custom("Formula1", size: 15))
                
            }
        }
        
    }
}

struct SocialNetworksView_Previews: PreviewProvider {
    static var previews: some View {
        SocialNetworksView()
    }
}
