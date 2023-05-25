//
//  MainOnboarding.swift
//  Telemetry Of Champions
//
//  Created by Adrián Castilla on 23/2/23.
//

import SwiftUI

struct MainOnboarding: View {
    
    @Binding var showOnboarding: Bool
    @State var selectedTab = 1
    
    var body: some View {
        
        TabView(selection: $selectedTab) {
            
            Page1()
                .tag(1)
            
            Page2()
                .tag(2)
            
            Page3()
                .tag(3)
            
            Page4(showOnboarding: $showOnboarding)
                .tag(4)
            
        }
        .tabViewStyle(PageTabViewStyle())
        .ignoresSafeArea()
    }
}

struct MainOnboarding_Previews: PreviewProvider {
    static var previews: some View {
        MainOnboarding(showOnboarding: .constant(true))
            .environment(\.locale, .init(identifier: "en"))
        MainOnboarding(showOnboarding: .constant(true))
            .environment(\.locale, .init(identifier: "es"))
    }
}
