//
//  AsterSpotEstimateFeeAction.swift
//  AsterSwift
//
//  Created by li shuai on 2025/10/19.
//
import Foundation
public struct AsterSpotEstimateFeeAction: AsterBaseAction {
    public var asset: String
    public var chainId: Int
    public var timestamp: Int
    public init(asset: String, chainId: Int) {
        self.asset = asset
        self.chainId = chainId
        self.timestamp = Int(Date().timeIntervalSince1970 * 1000)
    }
}

public struct AsterEstimateFeeAction: AsterBaseAction {
    public var currency: String
    public var chainId: Int
    public var accountType: String
    public var network: String
    public var timestamp: Int
    public init(asset: String, chainId: Int, accountType: String = "perp", network: String = "EVM") {
        self.currency = asset
        self.chainId = chainId
        self.timestamp = Int(Date().timeIntervalSince1970 * 1000)
        self.accountType = accountType
        self.network = network
    }
}
