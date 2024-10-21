//
//  ISO.swift
//  deeplinks
//
//  Created by Jan Švec on 14.08.2024.
//

import CodableWrappers
import Foundation

public struct ISO: ISO8601DateFormatterStaticCoder {
    nonisolated(unsafe) public static let iso8601DateFormatter: ISO8601DateFormatter = {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withInternetDateTime,
                                   .withFractionalSeconds]
        return formatter
    }()
}
