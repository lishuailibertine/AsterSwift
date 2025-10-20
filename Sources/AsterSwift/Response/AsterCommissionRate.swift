//
//  CommissionRate.swift
//  AsterSwift
//
//  Created by li shuai on 2025/10/13.
//
import Foundation

public struct AsterCommissionRate: Codable {
    /// 交易对，例如 BTCUSDT
    public let symbol: String

    /// 挂单手续费率（Maker 费率），如 0.0002 表示 0.02%
    public let makerCommissionRate: String

    /// 吃单手续费率（Taker 费率），如 0.0004 表示 0.04%
    public let takerCommissionRate: String
}
