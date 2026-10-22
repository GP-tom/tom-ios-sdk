import Foundation

/// Fiscalization of a transaction, returned in the transaction detail result.
/// Currently filled only for CZ fiscalization (EET).
public struct FiscalizationData: Codable, Equatable, Sendable {
    /// Registration status with the Financial Administration. Every status other than `registered`
    /// describes why the transaction has not been registered yet; none of them blocks the payment.
    public enum Status: String, Codable, Equatable, CaseIterable, Sendable {
        /// The fiscalization record was created and is waiting for processing.
        case created = "CREATED"
        /// The transaction is being registered with the Financial Administration.
        case propagationInProgress = "PROPAGATION_IN_PROGRESS"
        /// The Financial Administration registered the transaction; `pok` is available.
        case registered = "REGISTERED"
        /// Registration is blocked by the merchant's configuration, such as a missing or invalid certificate.
        case invalidConfig = "INVALID_CONFIG"
        /// No fiscal unit was selected for the terminal.
        case missingUnitId = "MISSING_UNIT_ID"
        /// Registration failed and will not be retried.
        case error = "ERROR"
        /// Registration failed and will be retried.
        case errorRetryable = "ERROR_RETRYABLE"
        /// The Financial Administration reported a conflict with an existing registration.
        case conflict = "CONFLICT"
    }

    /// `nil` when the payment app received a status this SDK version does not know.
    public let status: Status?
    /// Financial Administration approval code (POK), available once the transaction is registered.
    public let pok: String?
    /// Financial Administration identifier of the fiscal unit (establishment).
    public let unitId: Int?
    /// Name of the fiscal unit the transaction was reported under.
    public let unitName: String?

    public init(status: Status?, pok: String?, unitId: Int?, unitName: String?) {
        self.status = status
        self.pok = pok
        self.unitId = unitId
        self.unitName = unitName
    }

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        // An unknown status must not prevent decoding the rest of the result.
        self.status = try container.decodeIfPresent(String.self, forKey: .status).flatMap(Status.init(rawValue:))
        self.pok = try container.decodeIfPresent(String.self, forKey: .pok)
        self.unitId = try container.decodeIfPresent(Int.self, forKey: .unitId)
        self.unitName = try container.decodeIfPresent(String.self, forKey: .unitName)
    }
}
