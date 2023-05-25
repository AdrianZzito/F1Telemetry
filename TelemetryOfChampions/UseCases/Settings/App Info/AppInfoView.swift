//
//  AppInfoView.swift
//  Telemetry Of Champions
//
//  Created by Adrián Castilla on 26/2/23.
//

import SwiftUI

struct AppInfoView: View {
    
    @State var showingEasterEgg = false
    
    var body: some View {
        
        VStack {
            
            Image("tocLogo")
                .resizable()
                .frame(width: 100, height: 100)
                .cornerRadius(20)
                .shadow(radius: 5)
                .onTapGesture {
                    showingEasterEgg.toggle()
                }
            
            Text("Telemetry Of Champions")
                .padding(.top)
                .fontWeight(.bold)
                .font(.custom("Formula1", size: 20))
            Text("Version: \(Util.version())")
                .padding(.top, 1)
            Text("Copyright 2023 Antonio Castilla,\nAll Rights Reserved.")
                .padding(.top)
            
            Spacer()
            
            if showingEasterEgg {
                EasterEggView()
            }
            
            Spacer()
            
            Text("Telemetry Of Champions is not associated in any way with the Formula 1 Companies, F1, FORMULA 1, FIA FORMULA 1 WORLD CHAMPIONSHIP, GRAND PRIX and related marks are trade marks of Formula One Licensing B.V.")
                .font(.custom("Formula1", size: 10))
                .padding(.top)
                .padding(.bottom)
                .font(.footnote)
            
        }
        .font(.custom("Formula1", size: 15))
        
    }
}

struct AppInfoView_Previews: PreviewProvider {
    static var previews: some View {
        AppInfoView()
    }
}
