//
//  RefusalCode.swift
//
//
//  Created by Jan Švec on 01.06.2024.
//

import Foundation

public enum RefusalCode: String, CaseIterable, Codable {
    case unknown = "unknown"
    case approved = "approved"
    case approvedRequiredIdentification = "approvedRequiredIdentification"
    case declined = "declined"
    case expiredCard = "expiredCard"
    case pinTriesExceeded = "pinTriesExceeded"
    case callService = "callService"
    case technicalIssue = "technicalIssue"
    case invalidRequest = "invalidRequest"
    case captureCard = "captureCard"
    case declinedProblemWithCard = "declinedProblemWithCard"
    case invalidData = "invalidData"
    case insufficientFunds = "insufficientFunds"
    case usageLimitReached = "usageLimitReached"
    case duplicateTransaction = "duplicateTransaction"
    case amountLimitExceeded = "amountLimitExceeded"
    case transactionIsNotSupported = "transactionIsNotSupported"
    case callForAuthorization = "callForAuthorization"
    case declinedLowAmount = "declinedLowAmount"
    case pinRequired = "pinRequired"
    case cardNotSupported = "cardNotSupported"
    case invalidPin = "invalidPin"
    case technicalIssueOfTerminal = "technicalIssueOfTerminal"
    case declinedPurchasePossible = "declinedPurchasePossible"
    case invalidFormat = "invalidFormat"
    case delivered = "delivered"
    case stored = "stored"
    case noMoreData = "noMoreData"
    case moreDataExists = "moreDataExists"
    case invalidSupervisorCard = "invalidSupervisorCard"

    public var isApproved: Bool {
        switch self {
        case .approved, .approvedRequiredIdentification: true
        default: false
        }
    }
}
