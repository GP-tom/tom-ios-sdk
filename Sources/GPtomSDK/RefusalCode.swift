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
    
    public static func from(code: Int) -> RefusalCode {
        switch code {
        case 0...2, 5...10, 952...954:
            .approved
        case 3, 4:
            .approvedRequiredIdentification
        case 50, 66, 408:
            .declined
        case 51:
            .expiredCard
        case 52:
            .pinTriesExceeded
        case 53, 67, 102, 115, 120...122, 150, 207, 811, 820, 821, 898:
            .callService
        case 54, 60, 62, 63, 68...71, 73, 74, 90, 91, 98, 100, 103, 104, 108, 113, 200, 401...403, 801, 810, 899:
            .technicalIssue
        case 55, 56, 65:
            .invalidRequest
        case 57, 900...912:
            .captureCard
        case 58, 59, 61, 72, 84, 89, 93, 99, 111, 130...134, 205, 206, 400, 404...407:
            .declinedProblemWithCard
        case 64, 75, 97, 208:
            .invalidData
        case 76, 94:
            .insufficientFunds
        case 77, 79, 80, 82, 87, 107, 110:
            .usageLimitReached
        case 78:
            .duplicateTransaction
        case 81, 83, 95, 106, 112, 204:
            .amountLimitExceeded
        case 85:
            .transactionIsNotSupported
        case 86, 88, 101:
            .callForAuthorization
        case 92, 109, 202:
            .declinedLowAmount
        case 96:
            .pinRequired
        case 105:
            .cardNotSupported
        case 201:
            .invalidPin
        case 203, 209, 802, 809, 877, 878, 950:
            .technicalIssueOfTerminal
        case 251:
            .declinedProblemWithCard
        case 800:
            .invalidFormat
        case 870:
            .delivered
        case 871:
            .stored
        case 880:
            .noMoreData
        case 881:
            .moreDataExists
        case 951:
            .invalidSupervisorCard
        default:
            .unknown
        }
    }
}
