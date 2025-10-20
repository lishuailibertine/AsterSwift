//
//  AsterUserData.swift
//  AsterSwift
//
//  Created by li shuai on 2025/10/9.
//
import Foundation

// MARK: - 账户信息 v3 主结构
/// Aster Futures API v3 账户信息响应模型
public struct AsterAccountInfoV3: Decodable {

    /// 手续费等级
    public let feeTier: Int

    /// 是否可交易
    public let canTrade: Bool

    /// 是否可入金
    public let canDeposit: Bool

    /// 是否可出金
    public let canWithdraw: Bool

    /// 更新时间（毫秒时间戳）
    public let updateTime: Int64

    /// 当前所需起始保证金总额（仅计算 USDT 资产）
    public let totalInitialMargin: String

    /// 维持保证金总额（仅计算 USDT 资产）
    public let totalMaintMargin: String

    /// 账户总余额（仅计算 USDT 资产）
    public let totalWalletBalance: String

    /// 持仓未实现盈亏总额（仅计算 USDT 资产）
    public let totalUnrealizedProfit: String

    /// 保证金总余额（仅计算 USDT 资产）
    public let totalMarginBalance: String

    /// 持仓所需起始保证金（仅计算 USDT 资产）
    public let totalPositionInitialMargin: String

    /// 当前挂单所需起始保证金（仅计算 USDT 资产）
    public let totalOpenOrderInitialMargin: String

    /// 全仓账户余额（仅计算 USDT 资产）
    public let totalCrossWalletBalance: String

    /// 全仓持仓未实现盈亏总额（仅计算 USDT 资产）
    public let totalCrossUnPnl: String

    /// 可用余额（仅计算 USDT 资产）
    public let availableBalance: String

    /// 最大可转出余额（仅计算 USDT 资产）
    public let maxWithdrawAmount: String

    /// 账户资产详情
    public let assets: [AsterAccountAsset]

    /// 持仓信息列表
    public let positions: [AsterAccountPosition]
}

// MARK: - 资产信息
/// 单个资产账户信息
public struct AsterAccountAsset: Decodable {

    /// 资产名称（如 USDT、BUSD）
    public let asset: String

    /// 钱包余额
    public let walletBalance: String

    /// 未实现盈亏
    public let unrealizedProfit: String

    /// 保证金余额
    public let marginBalance: String

    /// 维持保证金
    public let maintMargin: String

    /// 当前所需起始保证金
    public let initialMargin: String

    /// 持仓所需起始保证金（基于最新标记价格）
    public let positionInitialMargin: String

    /// 当前挂单所需起始保证金（基于最新标记价格）
    public let openOrderInitialMargin: String

    /// 全仓账户余额
    public let crossWalletBalance: String

    /// 全仓持仓未实现盈亏
    public let crossUnPnl: String

    /// 可用余额
    public let availableBalance: String

    /// 最大可转出余额
    public let maxWithdrawAmount: String

    /// 是否可用作联合保证金
    public let marginAvailable: Bool

    /// 更新时间（毫秒时间戳）
    public let updateTime: Int64
}

// MARK: - 持仓信息
/// 单个交易对持仓详情
public struct AsterAccountPosition: Decodable {

    /// 交易对（如 BTCUSDT）
    public let symbol: String

    /// 当前所需起始保证金（基于最新标记价格）
    public let initialMargin: String

    /// 维持保证金
    public let maintMargin: String

    /// 持仓未实现盈亏
    public let unrealizedProfit: String

    /// 持仓所需起始保证金（基于最新标记价格）
    public let positionInitialMargin: String

    /// 当前挂单所需起始保证金（基于最新标记价格）
    public let openOrderInitialMargin: String

    /// 杠杆倍率
    public let leverage: String

    /// 是否为逐仓模式
    public let isolated: Bool

    /// 持仓成本价
    public let entryPrice: String

    /// 当前杠杆下用户可用的最大名义价值
    public let maxNotional: String

    /// 持仓方向（单向模式返回 BOTH，双向模式返回 LONG 或 SHORT）
    public let positionSide: String

    /// 持仓数量
    public let positionAmt: String

    /// 更新时间（毫秒时间戳）
    public let updateTime: Int64
    
    //
    public var logo: String?
}
