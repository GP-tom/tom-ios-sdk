//
//  Amount.swift
//  GPtomSDK
//
//  Created by Jan Švec on 21.10.2024.
//

import BigDecimal
import Foundation

public typealias Amount = BigDecimal

public extension Amount {
    static func fromInt64(_ value: Int64, fractionDigits: Int = 2) -> Amount? {
        let digits = max(0, fractionDigits)
        let sign = value < 0 ? "-" : ""
        let absString = String(Swift.abs(value))

        let normalized: String
        if digits == 0 {
            normalized = sign + absString
        } else {
            let whole = absString.dropLast(digits).isEmpty ? "0" : String(absString.dropLast(digits))
            let fraction = String(absString.suffix(digits)).padding(toLength: digits, withPad: "0", startingAt: 0)
            normalized = "\(sign)\(whole).\(fraction)"
        }

        return normalized.amount
    }

    var string: String {
        String(describing: self)
    }

    var int64: Int64 {
        let raw = String(describing: self)
        guard !raw.isEmpty else { return 0 }

        let isNegative = raw.hasPrefix("-")
        let unsigned = (raw.hasPrefix("-") || raw.hasPrefix("+")) ? String(raw.dropFirst()) : raw
        let parts = unsigned.split(separator: ".", maxSplits: 1, omittingEmptySubsequences: false)

        let integerDigits = String(parts.first ?? "0")
        let fractionDigits = parts.count > 1 ? String(parts[1]) : ""

        let centsFraction = String(fractionDigits.prefix(2)).padding(toLength: 2, withPad: "0", startingAt: 0)
        let combined = integerDigits + centsFraction

        guard let value = Int64(combined) else { return isNegative ? Int64.min : Int64.max }
        return isNegative ? -value : value
    }
}

public extension String {
    var amount: Amount? {
        let sanitized = replacingOccurrences(of: ",", with: ".")
        return BigDecimal(sanitized)
    }
}

public extension Double {
    var amount: Amount {
        BigDecimal(self)
    }
}
