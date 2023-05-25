//
//  SettingsViewModel.swift
//  Telemetry Of Champions
//
//  Created by Adrián Castilla on 26/2/23.
//

import Foundation
import SwiftUI

final class SettingsViewModel: ObservableObject {
    
    @AppStorage("favouriteDriver") var favouriteDriver = "VER"
    @AppStorage("favouriteSession") var favouriteSession = "Race"
    @AppStorage("autoSave") var autoSave = false
    
}
