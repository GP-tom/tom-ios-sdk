//
//  AppStatus.swift
//  GPtomSDK
//
//  Created by Jan Švec on 19.05.2025.
//

public struct AppStatus: Codable, Equatable, Sendable {
    public let appVersion: String
    public let userInfo: UserInfo?
    public var isLoggedIn: Bool { userInfo != nil }

    public init(appVersion: String,
                userInfo: UserInfo? = nil)
    {
        self.appVersion = appVersion
        self.userInfo = userInfo
    }
}

public struct UserInfo: Codable, Equatable, Sendable {
    public let clientId: String
    public let email: String
    public let businessId: String
    public let vatId: String?
    public let tid: String
    public let mid: String
    public let tipEnabled: Bool
    public let printerAvailable: Bool
    public let manualTransactionRestricted: Bool
    public let merchantLocation: String

    public init(
        clientId: String,
        email: String,
        businessId: String,
        vatId: String? = nil,
        tid: String,
        mid: String,
        tipEnabled: Bool,
        printerAvailable: Bool,
        manualTransactionRestricted: Bool,
        merchantLocation: String
    ) {
        self.clientId = clientId
        self.email = email
        self.businessId = businessId
        self.vatId = vatId
        self.tid = tid
        self.mid = mid
        self.tipEnabled = tipEnabled
        self.printerAvailable = printerAvailable
        self.manualTransactionRestricted = manualTransactionRestricted
        self.merchantLocation = merchantLocation
    }
}
