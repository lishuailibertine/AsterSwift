//
//  AsterOrderAction.swift
//  AsterSwift
//
//  Created by li shuai on 2025/9/25.
//

import Foundation

public enum AsterOrderSide: String, Encodable {
    case BUY
    case SELL
}

public enum AsterOrderType: String, Encodable {
    case LIMIT
    case MARKET
    case STOP_MARKET
    case TRAILING_STOP_MARKET
}

public enum AsterOrderPositionSide: String, Encodable {
    case LONG
    case SHORT
    case BOTH
}

// 🧾 永续合约下单请求模型（POST /fapi/v1/order）
public struct AsterOrderAction: AsterBaseAction {
    // MARK: - 基本订单参数
    /// 交易对，例如 `"BTCUSDT"`
    public let symbol: String
    
    /// 买卖方向，可选值：`BUY` 或 `SELL`
    public let side: AsterOrderSide
    
    /// 订单类型，例如：`LIMIT`, `MARKET`, `STOP_MARKET`, `TRAILING_STOP_MARKET`
    public let type: AsterOrderType
    
    /// 委托数量，例如 `"1.5"`
    public let quantity: String?
    
    public let leverage: String?
    /// 委托价格，仅限限价单（LIMIT）需要
    public let price: String?
    
    /// 有效方式，例如：`GTC`（成交为止）、`IOC`（立即成交或取消）
    public let timeInForce: String?
    
    /// 持仓方向，可选值：
    /// - `"BOTH"`：双向持仓（默认）
    /// - `"LONG"`：多单
    /// - `"SHORT"`：空单
    public let positionSide: AsterOrderPositionSide?
    
    /// 是否仅减仓（true 表示只能减少仓位，防止反向开仓）
    public let reduceOnly: String?
    
    /// 用户自定义订单号（客户端生成），方便追踪订单
    public let newClientOrderId: String?
    
    /// 触发价（用于止损止盈等条件单）
    public let stopPrice: String?
    
    /// 是否全平仓（true 表示条件触发后全平该持仓）
    public let closePosition: String?
    
    /// 跟踪止损激活价格，仅适用于 `TRAILING_STOP_MARKET`
    public let activationPrice: String?
    
    /// 跟踪止损回调比例（百分比，如 `"0.3"` 表示 0.3%）
    public let callbackRate: String?
    
    /// 条件价格触发类型，可选：
    /// - `"CONTRACT_PRICE"`（默认，按标记价格）
    /// - `"MARK_PRICE"`（按标记价格）
    public let workingType: String?
    
    /// 是否开启条件单触发保护
    public let priceProtect: Bool?
    
    /// 最大允许的延迟窗口（毫秒）
    public let recvWindow: Int?
    
    /// 当前请求的时间戳（毫秒）
    public let timestamp: Int
    
    // MARK: - 初始化方法
    
    public init(
        symbol: String,
        side: AsterOrderSide,
        type: AsterOrderType,
        quantity: String? = nil,
        leverage: String? = nil,
        price: String? = nil,
        timeInForce: String? = nil,
        positionSide: AsterOrderPositionSide? = nil,
        reduceOnly: String? = nil,
        newClientOrderId: String? = nil,
        stopPrice: String? = nil,
        closePosition: String? = nil,
        activationPrice: String? = nil,
        callbackRate: String? = nil,
        workingType: String? = nil,
        priceProtect: Bool? = nil,
        recvWindow: Int? = nil
    ) {
        self.symbol = symbol
        self.side = side
        self.type = type
        self.quantity = quantity
        self.leverage = leverage
        self.price = price
        self.timeInForce = timeInForce
        self.positionSide = positionSide
        self.reduceOnly = reduceOnly
        self.newClientOrderId = newClientOrderId
        self.stopPrice = stopPrice
        self.closePosition = closePosition
        self.activationPrice = activationPrice
        self.callbackRate = callbackRate
        self.workingType = workingType
        self.priceProtect = priceProtect
        self.recvWindow = recvWindow
        self.timestamp = Int(Date().timeIntervalSince1970 * 1000)
    }
}
