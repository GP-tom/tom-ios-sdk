import Foundation

/// Installment information returned in an app-to-app transaction receipt.
public struct InstallmentData: Codable, Equatable, Sendable {
    public enum FinancedBy: String, Codable, Equatable, Sendable {
        case bank = "BANK"
        case merchant = "MERCHANT"
    }

    public let selectedCount: Int
    public let financedBy: FinancedBy

    public init(selectedCount: Int, financedBy: FinancedBy) {
        self.selectedCount = selectedCount
        self.financedBy = financedBy
    }
}
