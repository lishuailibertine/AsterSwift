//
//  AsterKline.swift
//  AsterSwift
//
//  Created by li shuai on 2025/10/19.
//
import Foundation

public struct AsterKline: Decodable {
    /// 开盘时间（毫秒时间戳）
    public let openTime: Int64
    
    /// 开盘价
    public let openPrice: String
    
    /// 最高价
    public let highPrice: String
    
    /// 最低价
    public let lowPrice: String
    
    /// 收盘价（当前K线未结束的即为最新价）
    public let closePrice: String
    
    /// 成交量
    public let volume: String
    
    /// 收盘时间（毫秒时间戳）
    public let closeTime: Int64
    
    /// 成交额
    public let quoteAssetVolume: String
    
    /// 成交笔数
    public let numberOfTrades: Int
    
    /// 主动买入成交量
    public let takerBuyBaseVolume: String
    
    /// 主动买入成交额
    public let takerBuyQuoteVolume: String
    
    /// 额外字段（可忽略）
    public let ignore: String
    
    public init(from decoder: Decoder) throws {
        var container = try decoder.unkeyedContainer()
        openTime = try container.decode(Int64.self)
        openPrice = try container.decode(String.self)
        highPrice = try container.decode(String.self)
        lowPrice = try container.decode(String.self)
        closePrice = try container.decode(String.self)
        volume = try container.decode(String.self)
        closeTime = try container.decode(Int64.self)
        quoteAssetVolume = try container.decode(String.self)
        numberOfTrades = try container.decode(Int.self)
        takerBuyBaseVolume = try container.decode(String.self)
        takerBuyQuoteVolume = try container.decode(String.self)
        ignore = try container.decode(String.self)
    }
}

