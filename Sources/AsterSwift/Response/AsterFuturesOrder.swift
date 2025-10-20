//
//  AsterFuturesOrder.swift
//  AsterSwift
//
//  Created by li shuai on 2025/10/13.
//
import Foundation

/// 合约订单信息模型
public struct AsterFuturesOrder: Codable {
    /// 平均成交价
    public let avgPrice: String
    /// 用户自定义订单号
    public let clientOrderId: String
    /// 成交金额
    public let cumQuote: String
    /// 成交量
    public let executedQty: String
    /// 系统订单号
    public let orderId: Int
    /// 原始委托数量
    public let origQty: String
    /// 触发前订单类型
    public let origType: String
    /// 委托价格
    public let price: String
    /// 是否仅减仓
    public let reduceOnly: Bool
    /// 买卖方向（BUY / SELL）
    public let side: String
    /// 持仓方向（LONG / SHORT / BOTH）
    public let positionSide: String
    /// 订单状态（NEW / FILLED / CANCELED 等）
    public let status: String
    /// 触发价（对 TRAILING_STOP_MARKET 无效）
    public let stopPrice: String
    /// 是否全平仓
    public let closePosition: Bool
    /// 交易对（例如 BTCUSDT）
    public let symbol: String
    /// 订单时间（毫秒时间戳）
    public let time: Int64
    /// 有效方式（如 GTC、IOC）
    public let timeInForce: String
    /// 订单类型（如 LIMIT、MARKET、TRAILING_STOP_MARKET）
    public let type: String
    /// 跟踪止损激活价格（仅 TRAILING_STOP_MARKET 返回）
    public let activatePrice: String?
    /// 跟踪止损回调比例（仅 TRAILING_STOP_MARKET 返回）
    public let priceRate: String?
    /// 更新时间（毫秒时间戳）
    public let updateTime: Int64
    /// 条件价格触发类型（如 CONTRACT_PRICE）
    public let workingType: String
    /// 是否开启条件单触发保护
    public let priceProtect: Bool
}
