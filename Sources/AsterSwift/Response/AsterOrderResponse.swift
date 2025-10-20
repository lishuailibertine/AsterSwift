//
//  AsterOrderResponse.swift
//  AsterSwift
//
//  Created by li shuai on 2025/10/13.
//
import Foundation
/// 下单接口响应模型
public struct AsterOrderResponse: Decodable {
    /// 用户自定义的订单号
    public let clientOrderId: String
    /// 累计成交数量
    public let cumQty: String
    /// 累计成交金额
    public let cumQuote: String
    /// 已成交数量
    public let executedQty: String
    /// 系统订单号
    public let orderId: Int
    /// 平均成交价
    public let avgPrice: String
    /// 原始委托数量
    public let origQty: String
    /// 委托价格
    public let price: String
    /// 是否仅减仓
    public let reduceOnly: Bool
    /// 买卖方向（BUY / SELL）
    public let side: String
    /// 持仓方向（BOTH / LONG / SHORT）
    public let positionSide: String
    /// 订单状态（如 NEW、FILLED、CANCELED）
    public let status: String
    /// 触发价，对 `TRAILING_STOP_MARKET` 无效
    public let stopPrice: String
    /// 是否为条件全平仓单
    public let closePosition: Bool
    /// 交易对
    public let symbol: String
    /// 有效方法（如 GTC、IOC、FOK）
    public let timeInForce: String
    /// 订单类型（如 LIMIT、MARKET、STOP_MARKET、TRAILING_STOP_MARKET）
    public let type: String
    /// 触发前订单类型（如 TRAILING_STOP_MARKET）
    public let origType: String
    /// 跟踪止损激活价格，仅 `TRAILING_STOP_MARKET` 返回
    public let activatePrice: String?
    /// 跟踪止损回调比例，仅 `TRAILING_STOP_MARKET` 返回
    public let priceRate: String?
    /// 更新时间（毫秒时间戳）
    public let updateTime: Int
    /// 条件价格触发类型（如 CONTRACT_PRICE、MARK_PRICE）
    public let workingType: String
    /// 是否开启条件单触发保护
    public let priceProtect: Bool
}
