//
//  Util.swift
//  Telemetry Of Champions
//
//  Created by Adrián Castilla on 26/2/23.
//

import Foundation
import Kingfisher

final class Util {
    
    // MARK: - version()
    static func version() -> String {
        if let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String, let build = Bundle.main.infoDictionary?["CFBundleVersion"] as? String {
            return "\(version)(\(build))"
        }
        return ""
    }
    
    // MARK: - clearKFCache()
    func clearKFCache() {
        let cache = ImageCache.default
        
        cache.clearMemoryCache()
        cache.clearDiskCache { print("Done") }
    }
    
}
