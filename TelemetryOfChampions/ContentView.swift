//
//  ContentView.swift
//  F1Telemetry
//
//  Created by Adrián Castilla on 19/2/23.
//

import SwiftUI
import Kingfisher

struct ContentView: View {
    
    @State private var tabSelection = 2
    @AppStorage("showOnboarding") var showOnboarding = true
    
    var body: some View {
        
        TabView(selection: $tabSelection) {
            
            PreviousGenerationsView()
                .tabItem {
                    Label("pg", systemImage: "square.and.arrow.down")
                }
                .tag(1)
            
            MainView()
                .tabItem {
                    Label("generatetelemetry.tab.name", systemImage: "square.and.pencil")
                }
                .tag(2)
             
            SettingsView()
                .tabItem {
                    Label("settings", systemImage: "gear")
                }
                .tag(3)
            
        }
        .animation(.easeOut(duration: 0.2), value: tabSelection)
        .tint(.red)
        .fullScreenCover(isPresented: $showOnboarding) {
            MainOnboarding(showOnboarding: $showOnboarding)
        }
    }
}

// MARK: - Previews
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            
            ContentView()
                .preferredColorScheme(.light)
                .environment(\.locale, .init(identifier: "en"))
            
            ContentView()
                .preferredColorScheme(.light)
                .environment(\.locale, .init(identifier: "es"))
            
        }
        
    }
}
