import CodableWrappers
import Foundation

public struct Batch: Codable {
    /** Internal id of the batch, OPEN for pseudo batch with open transactions */
    public var amsId: String

    /** External batch number, can be null if not provided */
    public let batchNumber: String?

    public let communicationId: String?

    public let currency: String?

    @OptionalCoding<ISO8601DateFormatterCoding<ISO>>
    public var date: Date?

    @OptionalCoding<ISO8601DateFormatterCoding<ISO>>
    public var firstTransactionDate: Date?

    public let invalidCount: Double?

    @OptionalCoding<ISO8601DateFormatterCoding<ISO>>
    public var previousBatchDate: Date?

    public let saleAmount: Amount?

    public let saleCount: Double?

    public let subBatches: SubBatches?

    public let totalAmount: Amount?

    public let totalCount: Double?

    public let voidAmount: Amount?

    public let voidCount: Double?

    public var isOpen: Bool { amsId == "OPEN" }

    public init(amsId: String,
                batchNumber: String? = nil,
                communicationId: String? = nil,
                currency: String? = nil,
                date: Date? = nil,
                firstTransactionDate: Date? = nil,
                invalidCount: Double? = nil,
                previousBatchDate: Date? = nil,
                saleAmount: Amount? = nil,
                saleCount: Double? = nil,
                subBatches: SubBatches? = nil,
                totalAmount: Amount? = nil,
                totalCount: Double? = nil,
                voidAmount: Amount? = nil,
                voidCount: Double? = nil)
    {
        self.amsId = amsId
        self.batchNumber = batchNumber
        self.communicationId = communicationId
        self.currency = currency
        self.date = date
        self.firstTransactionDate = firstTransactionDate
        self.invalidCount = invalidCount
        self.previousBatchDate = previousBatchDate
        self.saleAmount = saleAmount
        self.saleCount = saleCount
        self.subBatches = subBatches
        self.totalAmount = totalAmount
        self.totalCount = totalCount
        self.voidAmount = voidAmount
        self.voidCount = voidCount
    }
}
