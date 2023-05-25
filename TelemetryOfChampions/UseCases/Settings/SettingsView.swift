//
//  SettingsView.swift
//  Telemetry Of Champions
//
//  Created by Adrián Castilla on 26/2/23.
//

import SwiftUI
import Kingfisher

struct SettingsView: View {
    
    // MARK: - Instances
    @StateObject var viewModel = ViewModel()
    @StateObject var settingsViewModel = SettingsViewModel()
    @StateObject var data = f1Data()
    @State var showingCacheAlert = false
    @State var reshowingOnboarding = false
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont(name: "Formula1", size: 30)!]
        
        UINavigationBar.appearance().titleTextAttributes = [.font : UIFont(name: "Formula1", size: 15)!]
        
    }
    
    var body: some View {
        
        NavigationStack {
            Form {
                
                Section("settings.section.appsettings.name") {
                    
                    /*
                    // MARK: - Favourite driver
                    Picker("Favourite Driver", selection: $settingsViewModel.favouriteDriver) {
                        ForEach(data.drivers2022, id: \.id) { driver in
                            Text(driver.name)
                                
                        }
                    }
                    .font(.custom("Formula1", size: 15))
                     */
                    
                    // MARK: - Telemetry auto save
                    Toggle("settings.telemetryautosave.name", isOn: $settingsViewModel.autoSave)
                        .font(.custom("Formula1", size: 15))
                    
                    // MARK: - Reshow onboarding
                    Button {
                        reshowingOnboarding.toggle()
                    } label: {
                        Text("settings.introscreenagain.name")
                            .foregroundColor(.red)
                            .font(.custom("Formula1", size: 15))
                    }
                    
                }
                
                Section {
                    
                    // MARK: - Clear cache
                    Button {
                        showingCacheAlert.toggle()
                    } label: {
                        Text("settings.button.cache")
                            .foregroundColor(.red)
                            .font(.custom("Formula1", size: 15))
                    }
                }
                
                // MARK: - About
                Section("settings.section.about.name") {
                    
                    NavigationLink {
                        AppInfoView()
                    } label: {
                        Text("Telemetry Of Champions")
                            .foregroundColor(.red)
                            .font(.custom("Formula1", size: 15))
                    }
                    
                    ServerStatusView()
                    
                }
                
                Section("settings.section.socialnetwork.name") {
                    SocialNetworksView()
                }
                
            }
            .navigationTitle(Text("settings"))
            
            .alert("settings.cachealert.title", isPresented: $showingCacheAlert) {
                Button("settings.cachealert.button.clear", role: .destructive) {
                    Util().clearKFCache()
                }
                Button("settings.cachealert.button.cancel", role: .cancel) {}
            }
            .fullScreenCover(isPresented: $reshowingOnboarding) {
                MainOnboarding(showOnboarding: $reshowingOnboarding)
            }
            
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
