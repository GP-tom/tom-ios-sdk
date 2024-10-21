//
//  ReceiptForApp2App.swift
//
//
//  Created by Jan Švec on 11.07.2024.
//

import CodableWrappers
import Foundation

public struct TransactionData: Codable {
    public let batchNumber: String?
    public let receiptNumber: String?
    public let terminalID: String?
    public let emvAid: String?
    public let emvAppLabel: String?
    public let cardNumber: String?
    public let transactionType: TransactionType?
    public let currencyCode: String?
    public let amount: String?
    public let totalAmount: String?
    public let pinOk: Bool?
    public let approvedCode: String?
    public let sequenceNumber: String?

    @OptionalCoding<ISO8601DateFormatterCoding<ISO>>
    public var date: Date?

    public let cardType: CardType?
    public let referenceNumber: String?
    public let transactionID: String?
    public let tipAmount: String?
    public let result: Int?
    public let cardEntryMode: String?
    public let merchantID: String?
    public let amsID: String? // Internal GP tom transaction ID, used for cancelling transaction

    public init(batchNumber: String?,
                receiptNumber: String?,
                terminalID: String?,
                emvAid: String?,
                emvAppLabel: String?,
                cardNumber: String?,
                transactionType: TransactionType?,
                currencyCode: String?,
                amount: String?,
                totalAmount: String?,
                pinOk: Bool?,
                approvedCode: String?,
                sequenceNumber: String?,
                date: Date?,
                cardType: CardType?,
                referenceNumber: String?,
                transactionID: String?,
                tipAmount: String?,
                result: Int?,
                cardEntryMode: String?,
                merchantID: String?,
                amsID: String?)
    {
        self.batchNumber = batchNumber
        self.receiptNumber = receiptNumber
        self.terminalID = terminalID
        self.emvAid = emvAid
        self.emvAppLabel = emvAppLabel
        self.cardNumber = cardNumber
        self.transactionType = transactionType
        self.currencyCode = currencyCode
        self.amount = amount
        self.totalAmount = totalAmount
        self.pinOk = pinOk
        self.approvedCode = approvedCode
        self.sequenceNumber = sequenceNumber
        self.date = date
        self.cardType = cardType
        self.referenceNumber = referenceNumber
        self.transactionID = transactionID
        self.tipAmount = tipAmount
        self.result = result
        self.cardEntryMode = cardEntryMode
        self.merchantID = merchantID
        self.amsID = amsID
    }
}
