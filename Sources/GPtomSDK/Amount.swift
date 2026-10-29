//
//  Amount.swift
//  GPtomSDK
//
//  Created by Jan Švec on 21.10.2024.
//

import Foundation

public typealias Amount = Decimal

public extension Amount {
    var string: String {
        String(describing: self)
    }

    var int64: Int64 {
        .init(truncating: self * 100 as NSDecimalNumber)
    }
}

public extension String {
    var amount: Amount? {
        let sanitized = replacingOccurrences(of: ",", with: ".")
            .filter { !$0.isWhitespace }
        return Decimal(string: sanitized)
    }

    var localizedAmount: Amount? {
        let sanitized = filter { !$0.isWhitespace }

        let formatter = NumberFormatter()
        formatter.locale = .autoupdatingCurrent
        formatter.numberStyle = .decimal
        formatter.generatesDecimalNumbers = true

        return formatter.number(from: sanitized)?.decimalValue
    }
}

public extension Double {
    var amount: Amount {
        Decimal(self)
    }
}
