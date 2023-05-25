//
//  MainView.swift
//  Telemetry Of Champions
//
//  Created by Adrián Castilla on 25/2/23.
//

import SwiftUI
import Kingfisher

struct MainView: View {
    
    // MARK: - TEST ENDPOINT: http://**serverip**:81/telemetry/?year=2022&grand_prix=bahrain&session=r&driver1=ver&driver2=lec
    
    
    // MARK: - Instances
    @StateObject var viewModel = ViewModel()
    @StateObject var data = f1Data()
    @StateObject var settingsViewModel = SettingsViewModel()
    
    // MARK: - @State values
    @State var selectedSession = "Race"
    @State var selectedYear = 2022
    @State var driver1 = "VER"
    @State var driver2 = "LEC"
    @State var grandPrix = "Bahrain"
    @State var displayingImage = false
    @State var url = URL(string: "")
    @State var stringedYear = ""
    @State var showingSaveButton = false
    @State var showOnboarding: Bool = false
    
    // MARK: - Initializer
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont(name: "Formula1", size: 30)!]
        
        UINavigationBar.appearance().titleTextAttributes = [.font : UIFont(name: "Formula1", size: 15)!]
        
    }
    
    var body: some View {
        
        NavigationStack {
            
            ScrollView {
                
                VStack {
                    
                    // MARK: - Track info
                    ZStack {
                        
                        Rectangle()
                            .frame(width: 350, height: 150)
                            .cornerRadius(20)
                            .foregroundColor(.white)
                        
                        HStack {
                            
                            
                            Image("\(grandPrix.lowercased())")
                                .resizable()
                                .frame(width: 150, height: 125, alignment: .center)
                                .clipped()
                                .scaledToFit()
                                .padding(.leading)
                            
                        }
                        .padding(.trailing, 210)
                        
                        HStack {
                            
                            ZStack {
                                
                                Image("f1intro")
                                    .resizable()
                                    .frame(width: 250, height: 150)
                                    .cornerRadius(30)
                                    .clipped()
                                    .padding(.trailing, 30)
                                    .padding(.bottom)
                                
                                Text("\(String(selectedYear))\n\(grandPrix.uppercased())\n GRAND PRIX")
                                    .foregroundColor(.black)
                                    .font(.custom("Formula1", size: 22, relativeTo: .title))
                                    .multilineTextAlignment(.trailing)
                                    .padding(.bottom, 5)
                                    .padding(.top, 5)
                                    .fontWeight(.bold)
                            }
                            .padding(.trailing)
                            
                        }
                        .padding(.leading, 140)
                        
                    }
                    
                    
                    // MARK: - Parameters
                    HStack {
                        
                        
                        // MARK: - Year
                        Text("generatetelemetry.picker.year")
                            .font(.custom("Formula1", size: 20))
                            .fontWeight(.bold)
                        
                        
                        Picker("Year", selection: $selectedYear) {
                            ForEach(data.year, id: \.self) { year in
                                Text(String(year))
                                
                            }
                            
                        }
                        .tint(.red)
                        
                        
                    }
                    
                    HStack {
                        
                        // MARK: - Grand Prix
                        Text("generatetelemetry.picker.grandprix")
                            .font(.custom("Formula1", size: 20))
                            .fontWeight(.bold)
                        
                        Picker("Grand Prix", selection: $grandPrix) {
                            ForEach(data.grandPrixData[selectedYear]!, id: \.self) { grandPrix in
                                Text(grandPrix)
                            }
                        }
                        .tint(.red)
                    }
                    
                    HStack {
                        
                        // MARK: - Session
                        Text("generatetelemetry.picker.session")
                            .font(.custom("Formula1", size: 20))
                            .fontWeight(.bold)
                        
                        Picker("Session", selection: $selectedSession) {
                            ForEach(data.session, id: \.self) { session in
                                Text(session)
                            }
                        }
                        .tint(.red)
                    }
                    .padding(.bottom)
                    
                    // MARK: - Driver parameters with images
                    HStack {
                        
                        VStack {
                            
                            // MARK: - Driver 1
                            Image(viewModel.loadImage(driverArray: viewModel.driverPickerData(year: selectedYear), searching: driver1))
                                .resizable()
                                .frame(width: 160, height: 50)
                                .clipped()
                            
                            Picker("Driver1", selection: $driver1) {
                                ForEach(viewModel.driverPickerData(year: selectedYear), id: \.name) { driver in
                                    Text(driver.name)
                                }
                            }
                            .tint(.red)
                            
                        }
                        
                        Text("vs")
                            .font(.custom("Formula1", size: 20))
                        
                        VStack {
                            
                            // MARK: - Driver 2
                            Image(viewModel.loadImage(driverArray: viewModel.driverPickerData(year: selectedYear), searching: driver2))
                                .resizable()
                                .frame(width: 160, height: 50)
                                .clipped()
                            
                            Picker("Driver2", selection: $driver2) {
                                ForEach(viewModel.driverPickerData(year: selectedYear), id: \.name) { driver in
                                    Text(driver.name)
                                }
                            }
                            .tint(.red)
                        }
                    }
                    
                    
                    // MARK: - Generate telemetry button
                    Button {
                        stringedYear = "\(selectedYear)"
                        displayingImage = true
                        url = URL(string: "http://**serverip**:81/telemetry/?year=\(selectedYear)&grand_prix=\(grandPrix)&session=\(selectedSession)&driver1=\(driver1)&driver2=\(driver2)")
                        viewModel.saveTelemetry(year: selectedYear, session: selectedSession, grandPrix: grandPrix, driver1: driver1, driver2: driver2)
                        if settingsViewModel.autoSave {
                            viewModel.saveImage(url: url!)
                        }
                    } label: {
                        Text("generatetelemetry.button.generate")
                            .frame(alignment: .center)
                            .font(.custom("Formula1", size: 20))
                        
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.red)
                    
                    if displayingImage {
                        // MARK: - Telemetry image display via KFImage
                        KFImage(url!)
                            .placeholder {
                                LoadingView()
                            }
                            .resizable()
                            .scaledToFit()
                            .frame(width: 450, height: 500)
                            .onAppear {
                                showingSaveButton = true
                            }
                        
                    } else {
                        Text("generatetelemetry.text.advice")
                            .lineLimit(60)
                            .padding(.top)
                            .font(.custom("Formula1", size: 17, relativeTo: .headline))
                    }
                    
                    // MARK: - Save button
                    if showingSaveButton {
                        Button {
                            viewModel.saveImage(url: url!)
                        } label: {
                            Text("generatetelemetry.button.save")
                                .font(.custom("Formula1", size: 20))
                        }
                        .buttonStyle(.borderedProminent)
                    }
                    
                }
                
                .navigationTitle(Text("generatetelemetry.nav.title"))
            }
            // MARK: - Timeout extension
            .onAppear {
                viewModel.extendTimeout()
            }
            /*
            .toolbar {
                CreditView()
            }
             */
        }
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
