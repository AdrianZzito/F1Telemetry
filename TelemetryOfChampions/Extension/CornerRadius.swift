//
//  CornerRadius.swift
//  Telemetry Of Champions
//
//  Created by Adrián Castilla on 27/2/23.
//

import Foundation
import SwiftUI

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}
