//
//  Untitled.swift
//  AsterSwift
//
//  Created by li shuai on 2025/10/19.
//
import Foundation
// MARK: - 根结构：交易所信息
public struct AsterExchangeInfo: Decodable {
    public let assets: [AsterAsset]
    public let symbols: [AsterSymbol]
}

// MARK: - 资产信息
public struct AsterAsset: Decodable {
    public let asset: String              // 资产名称，如 "USDT"
    public let marginAvailable: Bool      // 是否可用于保证金
}

// MARK: - 交易对信息
public struct AsterSymbol: Decodable {
    public let symbol: String                 // 交易对名称，例如 "BTCUSDT"
    public let pair: String                   // 标的交易对
    public let contractType: String           // 合约类型，如 PERPETUAL
    public let deliveryDate: Int64            // 交割日期
    public let onboardDate: Int64             // 上线日期
    public let status: String                 // 状态，如 TRADING
    public let baseAsset: String              // 标的资产
    public let quoteAsset: String             // 报价资产
    public let marginAsset: String            // 保证金资产
    public let pricePrecision: Int            // 价格小数位数
    public let quantityPrecision: Int         // 数量小数位数
    public let baseAssetPrecision: Int        // 标的资产精度
    public let quotePrecision: Int            // 报价资产精度
    public let underlyingType: String         // 标的类型
    public let underlyingSubType: [String]    // 子类型
    public let settlePlan: Int
    public let triggerProtect: String         // priceProtect 阈值
    public let filters: [AsterFilter]         // 过滤器数组（使用方案一解码）
    public let liquidationFee: String         // 强平费率
    public let marketTakeBound: String        // 市价吃单最大偏离比例
}

// MARK: - filters：严格方案一实现（按 filterType 精确解码）
public struct AsterFilter: Decodable {
    public let filterType: String
    
    // 可选字段（仅在特定类型中出现）
    public let maxPrice: String?
    public let minPrice: String?
    public let tickSize: String?
    
    public let maxQty: String?
    public let minQty: String?
    public let stepSize: String?
    
    public let limit: Int?
    public let notional: String?
    
    // MARK: - 解码键
    private enum CodingKeys: String, CodingKey {
        case filterType
        case maxPrice, minPrice, tickSize
        case maxQty, minQty, stepSize
        case limit, notional
    }
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.filterType = try container.decode(String.self, forKey: .filterType)
        var maxPrice: String?
        var minPrice: String?
        var tickSize: String?
        var maxQty: String?
        var minQty: String?
        var stepSize: String?
        var limit: Int?
        var notional: String?
        switch filterType {
        case "PRICE_FILTER":
            maxPrice = try container.decodeIfPresent(String.self, forKey: .maxPrice)
            minPrice = try container.decodeIfPresent(String.self, forKey: .minPrice)
            tickSize = try container.decodeIfPresent(String.self, forKey: .tickSize)
            
        case "LOT_SIZE", "MARKET_LOT_SIZE":
            maxQty = try container.decodeIfPresent(String.self, forKey: .maxQty)
            minQty = try container.decodeIfPresent(String.self, forKey: .minQty)
            stepSize = try container.decodeIfPresent(String.self, forKey: .stepSize)
            
        case "MAX_NUM_ORDERS", "MAX_NUM_ALGO_ORDERS":
            limit = try container.decodeIfPresent(Int.self, forKey: .limit)
            
        case "MIN_NOTIONAL":
            notional = try container.decodeIfPresent(String.self, forKey: .notional)
        default:
            break
        }
        self.maxPrice = maxPrice
        self.minPrice = minPrice
        self.tickSize = tickSize
        self.maxQty = maxQty
        self.minQty = minQty
        self.stepSize = stepSize
        self.limit = limit
        self.notional = notional
    }
}
