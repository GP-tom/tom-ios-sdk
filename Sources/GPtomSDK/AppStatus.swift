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
}
