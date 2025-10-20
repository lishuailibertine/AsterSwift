//
//  Untitled.swift
//  AsterSwift
//
//  Created by li shuai on 2025/10/19.
//
import Foundation

public struct AsterMarketTicker: Decodable {
    /// 交易对（如 INJUSDT）
    public let symbol: String

    /// 基础币种（如 INJ）
    public let baseAsset: String

    /// 计价币种（如 USDT）
    public let quoteAsset: String

    /// 最新成交价
    public let lastPrice: CGFloat

    /// 最高价
    public let highPrice: CGFloat

    /// 最低价
    public let lowPrice: CGFloat

    /// 成交量（基础币种）
    public let baseVolume: CGFloat

    /// 成交额（计价币种）
    public let quoteVolume: CGFloat

    /// 未平仓合约数量（Open Interest）
    public let openInterest: CGFloat
}
