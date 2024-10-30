//
//  SubBatches.swift
//
//
//  Created by Jan Švec on 05.05.2023.
//

import Foundation

public struct SubBatches: Codable, Equatable, Sendable {
    public let card: SubBatch?
    public let goCrypto: SubBatch?
    public let cash: SubBatch?

    public enum CodingKeys: String, CodingKey {
        case card = "CARD"
        case goCrypto = "GO_CRYPTO"
        case cash = "CASH"
    }

    public init(card: SubBatch? = nil,
                goCrypto: SubBatch? = nil,
                cash: SubBatch? = nil)
    {
        self.card = card
        self.goCrypto = goCrypto
        self.cash = cash
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.card = try container.decodeIfPresent(SubBatch.self, forKey: .card)
        self.goCrypto = try container.decodeIfPresent(SubBatch.self, forKey: .goCrypto)
        self.cash = try container.decodeIfPresent(SubBatch.self, forKey: .cash)
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.card, forKey: .card)
        try container.encodeIfPresent(self.goCrypto, forKey: .goCrypto)
        try container.encodeIfPresent(self.cash, forKey: .cash)
    }
}
