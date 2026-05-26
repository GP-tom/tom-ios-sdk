//
//  TransactionType.swift
//  GPtomSDK
//
//  Created by Jan Švec on 28.08.2025.
//

public enum TransactionType: String, Equatable, CaseIterable, Codable, Sendable {
    case cash = "CASH"
    case card = "CARD"
    case qr = "ACCOUNT_PAYMENT"
    case blik = "BLIK_PAYMENT"
    case gateway = "PAYMENT_GATEWAY"
}
