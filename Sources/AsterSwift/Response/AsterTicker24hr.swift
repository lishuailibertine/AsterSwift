//
//  AsterTicker24hr.swift
//  AsterSwift
//
//  Created by li shuai on 2025/10/19.
//
import Foundation

public struct AsterTicker24hr: Decodable {
    /// 交易对
    public let symbol: String

    /// 价格变动（绝对值）
    public let priceChange: String

    /// 价格变动百分比
    public let priceChangePercent: String

    /// 加权平均价
    public let weightedAvgPrice: String

    /// 最新成交价
    public let lastPrice: String

    /// 最新成交量
    public let lastQty: String

    /// 开盘价
    public let openPrice: String

    /// 最高价
    public let highPrice: String

    /// 最低价
    public let lowPrice: String

    /// 成交量（基础币种）
    public let volume: String

    /// 成交额（计价币种）
    public let quoteVolume: String

    /// 开盘时间（毫秒时间戳）
    public let openTime: Int64

    /// 收盘时间（毫秒时间戳）
    public let closeTime: Int64

    /// 第一笔成交ID
    public let firstId: Int

    /// 最后一笔成交ID
    public let lastId: Int

    /// 成交笔数
    public let count: Int
}
