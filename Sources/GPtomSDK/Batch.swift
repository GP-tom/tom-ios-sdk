import Foundation

public struct Batch: Codable, Equatable, Sendable, Identifiable {
    public enum CodingKeys: CodingKey {
        case amsId
        case batchNumber
        case communicationId
        case currency
        case date
        case firstTransactionDate
        case installmentCount
        case installmentAmount
        case invalidCount
        case previousBatchDate
        case saleAmount
        case saleCount
        case subBatches
        case totalAmount
        case totalCount
        case voidAmount
        case voidCount
        case tipAmount
        case tipCount
        case tipAverage
        case tipAveragePercentage
    }

    /** Internal id of the batch, OPEN for pseudo batch with open transactions */
    public var amsId: String

    /** External batch number, can be null if not provided */
    public let batchNumber: String?

    public let communicationId: String?

    public let currency: String?

    public var date: Date?

    public var firstTransactionDate: Date?

    public let installmentCount: Int?

    public let installmentAmount: Amount?

    public let invalidCount: Double?

    public var previousBatchDate: Date?

    public let saleAmount: Amount?

    public let saleCount: Double?

    public let subBatches: SubBatches?

    public let totalAmount: Amount?

    public let totalCount: Double?

    public let voidAmount: Amount?

    public let voidCount: Double?

    public let tipAmount: Amount

    public let tipCount: Int

    public let tipAverage: Amount

    public let tipAveragePercentage: Double

    public var id: String {
        amsId
    }

    public var isOpen: Bool {
        amsId == "OPEN"
    }

    public init(
        amsId: String,
        batchNumber: String? = nil,
        communicationId: String? = nil,
        currency: String? = nil,
        date: Date? = nil,
        firstTransactionDate: Date? = nil,
        installmentCount: Int? = nil,
        installmentAmount: Amount? = nil,
        invalidCount: Double? = nil,
        previousBatchDate: Date? = nil,
        saleAmount: Amount? = nil,
        saleCount: Double? = nil,
        subBatches: SubBatches? = nil,
        totalAmount: Amount? = nil,
        totalCount: Double? = nil,
        voidAmount: Amount? = nil,
        voidCount: Double? = nil,
        tipAmount: Amount? = nil,
        tipCount: Int? = nil,
        tipAverage: Amount? = nil,
        tipAveragePercentage: Double? = nil
    ) {
        self.amsId = amsId
        self.batchNumber = batchNumber
        self.communicationId = communicationId
        self.currency = currency
        self.date = date
        self.firstTransactionDate = firstTransactionDate
        self.installmentCount = installmentCount
        self.installmentAmount = installmentAmount
        self.invalidCount = invalidCount
        self.previousBatchDate = previousBatchDate
        self.saleAmount = saleAmount
        self.saleCount = saleCount
        self.subBatches = subBatches
        self.totalAmount = totalAmount
        self.totalCount = totalCount
        self.voidAmount = voidAmount
        self.voidCount = voidCount
        self.tipAmount = tipAmount ?? 0
        self.tipCount = tipCount ?? 0
        self.tipAverage = tipAverage ?? 0
        self.tipAveragePercentage = tipAveragePercentage ?? 0
    }

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        amsId = try container.decode(String.self, forKey: .amsId)
        batchNumber = try container.decodeIfPresent(String.self, forKey: .batchNumber)
        communicationId = try container.decodeIfPresent(String.self, forKey: .communicationId)
        currency = try container.decodeIfPresent(String.self, forKey: .currency)

        if let date = try container.decodeIfPresent(String.self, forKey: .date) {
            self.date = ISO.iso8601DateFormatter.date(from: date)
        }

        if let date = try container.decodeIfPresent(String.self, forKey: .firstTransactionDate) {
            firstTransactionDate = ISO.iso8601DateFormatter.date(from: date)
        }

        if let date = try container.decodeIfPresent(String.self, forKey: .previousBatchDate) {
            previousBatchDate = ISO.iso8601DateFormatter.date(from: date)
        }

        installmentCount = try container.decodeIfPresent(Int.self, forKey: .installmentCount)
        installmentAmount = try container.decodeIfPresent(Amount.self, forKey: .installmentAmount)

        invalidCount = try container.decodeIfPresent(Double.self, forKey: .invalidCount)
        saleAmount = try container.decodeIfPresent(Amount.self, forKey: .saleAmount)
        saleCount = try container.decodeIfPresent(Double.self, forKey: .saleCount)
        subBatches = try container.decodeIfPresent(SubBatches.self, forKey: .subBatches)
        totalAmount = try container.decodeIfPresent(Amount.self, forKey: .totalAmount)
        totalCount = try container.decodeIfPresent(Double.self, forKey: .totalCount)
        voidAmount = try container.decodeIfPresent(Amount.self, forKey: .voidAmount)
        voidCount = try container.decodeIfPresent(Double.self, forKey: .voidCount)
        tipAmount = try container.decodeIfPresent(Amount.self, forKey: .tipAmount) ?? 0
        tipCount = try container.decodeIfPresent(Int.self, forKey: .tipCount) ?? 0
        tipAverage = try container.decodeIfPresent(Amount.self, forKey: .tipAverage) ?? 0
        tipAveragePercentage = try container.decodeIfPresent(Double.self, forKey: .tipAveragePercentage) ?? 0
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(amsId, forKey: .amsId)
        try container.encodeIfPresent(batchNumber, forKey: .batchNumber)
        try container.encodeIfPresent(communicationId, forKey: .communicationId)
        try container.encodeIfPresent(currency, forKey: .currency)

        let date = date.flatMap { ISO.iso8601DateFormatter.string(from: $0) }
        try container.encodeIfPresent(date, forKey: .date)

        let firstTransactionDate = firstTransactionDate.flatMap { ISO.iso8601DateFormatter.string(from: $0) }
        try container.encodeIfPresent(firstTransactionDate, forKey: .firstTransactionDate)

        try container.encodeIfPresent(installmentCount, forKey: .installmentCount)
        try container.encodeIfPresent(installmentAmount, forKey: .installmentAmount)

        try container.encodeIfPresent(invalidCount, forKey: .invalidCount)

        let previousBatchDate = previousBatchDate.flatMap { ISO.iso8601DateFormatter.string(from: $0) }
        try container.encodeIfPresent(previousBatchDate, forKey: .previousBatchDate)

        try container.encodeIfPresent(saleAmount, forKey: .saleAmount)
        try container.encodeIfPresent(saleCount, forKey: .saleCount)
        try container.encodeIfPresent(subBatches, forKey: .subBatches)
        try container.encodeIfPresent(totalAmount, forKey: .totalAmount)
        try container.encodeIfPresent(totalCount, forKey: .totalCount)
        try container.encodeIfPresent(voidAmount, forKey: .voidAmount)
        try container.encodeIfPresent(voidCount, forKey: .voidCount)
        try container.encodeIfPresent(tipAmount, forKey: .tipAmount)
        try container.encodeIfPresent(tipCount, forKey: .tipCount)
        try container.encodeIfPresent(tipAverage, forKey: .tipAverage)
        try container.encodeIfPresent(tipAveragePercentage, forKey: .tipAveragePercentage)
    }
}
