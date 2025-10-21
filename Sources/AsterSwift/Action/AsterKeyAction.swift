//
//  AsterKeyAction.swift
//  AsterSwift
//
//  Created by li shuai on 2025/10/19.
//
import Foundation
public struct AsterKeyAction: AsterBaseAction {
    public var userOperationType: String
    public var userSignature: String
    public var address: String
    public var desc: String
    public var timestamp: Int
    public var keyId: Int?
    public var network: String?
    public init(userOperationType: String, userSignature: String, address: String, desc: String, network: String?, keyId: Int?) {
        self.userOperationType = userOperationType
        self.userSignature = userSignature
        self.address = address
        self.desc = desc
        self.network = network
        self.keyId = keyId
        self.timestamp = Int(Date().timeIntervalSince1970 * 1000)
    }
}

public struct AsterGetNonce: AsterBaseAction {
    public var userOperationType: String
    public var address: String
    public var timestamp: Int
    public var network: String?
    public init(userOperationType: String, address: String, network: String?) {
        self.userOperationType = userOperationType
        self.address = address
        self.network = network
        self.timestamp = Int(Date().timeIntervalSince1970 * 1000)
    }
}
