//
//  AsterPosition.swift
//  AsterSwift
//
//  Created by li shuai on 2025/10/19.
//
import Foundation
public struct AsterPosition: Decodable {
    /// 交易对（如 BTCUSDT）
    public let symbol: String
    
    /// 开仓均价
    public let entryPrice: String
    
    /// 保证金模式（isolated 或 cross）
    public let marginType: String
    
    /// 是否自动追加保证金
    public let isAutoAddMargin: String
    
    /// 逐仓保证金
    public let isolatedMargin: String
    
    public let notional: String
    /// 当前杠杆倍数
    public let leverage: String
    
    /// 强平价格
    public let liquidationPrice: String
    
    /// 当前标记价格
    public let markPrice: String
    
    /// 当前杠杆允许的名义价值上限
    public let maxNotionalValue: String
    
    /// 持仓数量（正数为多，负数为空）
    public let positionAmt: String
    
    /// 持仓方向（BOTH / LONG / SHORT）
    public let positionSide: String
    
    /// 未实现盈亏
    public let unRealizedProfit: String
    
    /// 更新时间（毫秒时间戳）
    public let updateTime: Int64
    
    public var logo: String?
}
