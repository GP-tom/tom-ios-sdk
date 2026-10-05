import Foundation

public struct SubBatch: Codable, Equatable, Sendable {
    public struct Installment: Codable, Equatable, Sendable {
        public let count: Int
        public let amount: Amount

        public init(count: Int, amount: Amount) {
            self.count = count
            self.amount = amount
        }
    }

    public let installment: Installment?
    public let closeBatchNumber: String?
    public let saleAmount: Amount?
    public let saleCount: Double?
    public let totalAmount: Amount?
    public let totalCount: Double?
    public let voidAmount: Amount?
    public let voidCount: Double?

    public init(closeBatchNumber: String? = nil,
                saleAmount: Amount? = nil,
                saleCount: Double? = nil,
                totalAmount: Amount? = nil,
                totalCount: Double? = nil,
                voidAmount: Amount? = nil,
                voidCount: Double? = nil,
                installment: Installment? = nil)
    {
        self.installment = installment
        self.closeBatchNumber = closeBatchNumber
        self.saleAmount = saleAmount
        self.saleCount = saleCount
        self.totalAmount = totalAmount
        self.totalCount = totalCount
        self.voidAmount = voidAmount
        self.voidCount = voidCount
    }

    public var hasAnyTransactions: Bool {
        (totalCount ?? 0) > 0
    }
}
