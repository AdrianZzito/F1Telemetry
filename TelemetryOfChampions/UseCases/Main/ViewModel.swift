//
//  ViewModel.swift
//  F1Telemetry
//
//  Created by Adrián Castilla on 19/2/23.
//

import Foundation
import SwiftUI
import Kingfisher

final class ViewModel: ObservableObject {
    
    var data = f1Data()
    
    @Published var telemetries: [Telemetry] = []
    @Published var debugData: [Telemetry] = [
        Telemetry(year: 2022, grandPrix: "Bahrain", session: "Race", driver1: "VER", driver2: "LEC"),
        Telemetry(year: 2022, grandPrix: "Bahrain", session: "Race", driver1: "PER", driver2: "LEC")
    ]
    
    // MARK: - Initializers
    init() {
        telemetries = getAllTelemetries()
    }
    
    // MARK: - driverPickerData(): Determines what data should be displayed in the driver picker
    func driverPickerData(year: Int) -> [Driver] {
        
        if year == 2023 {
            return data.drivers2023
        } else if year == 2022 {
            return data.drivers2022
        } else if year == 2021 {
            return data.drivers2021
        } else {
            return data.drivers2020
        }
        
    }
    
    // MARK: - saveImage(): Saves the image using the KingFisher downloader
    func saveImage(url: URL) {
        let downloader = ImageDownloader.default
        
        downloader.downloadImage(with: url) { result in
            switch result {
            case .success(let value):
                UIImageWriteToSavedPhotosAlbum(value.image, nil, nil, nil)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    // MARK: - loadImage(): Makes able to load the car image above the driver picker
    func loadImage(driverArray: [Driver], searching: String) -> String {
        
        if let idx = driverArray.firstIndex(where: { $0.name == searching }) {
            return "\(driverArray[idx].team)\(driverArray[idx].year)"
        }
        return ""
    }
    
    // MARK: - extendTimeout(): Extends the timeout of the KFImage requests to avoid mischarges
    func extendTimeout() {
        KingfisherManager.shared.downloader.downloadTimeout = 240
//        print("Timeout extended")
    }
    
    // MARK: - saveTelemetry(): Inserts the generated telemetry in an array and calls encodeAndSave()
    func saveTelemetry(year: Int, session: String, grandPrix: String, driver1: String, driver2: String) {
        let newTelemetry = Telemetry(year: year, grandPrix: grandPrix, session: session, driver1: driver1, driver2: driver2)
        telemetries.insert(newTelemetry, at: 0)
        encodeAndSave()
    }
    
    // MARK: - encodeAndSave(): Uses JSONEncoder to encode and UserDefauts to persist the data inside the telemetries array
    private func encodeAndSave() {
        if let encoded = try? JSONEncoder().encode(telemetries) {
            UserDefaults.standard.set(encoded, forKey: "telemetries")
        }
    }
    
    // MARK: - getAllTelemetries(): Uses JSONDecoder() to decode all data in telemetries and retrieves that data
    func getAllTelemetries() -> [Telemetry] {
        if let telemetriesData = UserDefaults.standard.object(forKey: "telemetries") as? Data {
            if let telemetries = try? JSONDecoder().decode([Telemetry].self, from: telemetriesData) {
                return telemetries
            }
        }
        return []
    }
    
    // MARK: - removeTelemetry(): Removes the saved telemetry specified in the id parameter
    func removeTelemetry(withId id: String) {
        telemetries.removeAll(where: { $0.id == id })
        encodeAndSave()
    }
    
}
