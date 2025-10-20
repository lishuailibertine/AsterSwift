//
//  AsterPremiumIndex.swift
//  AsterSwift
//
//  Created by li shuai on 2025/10/19.
//
import Foundation
public struct AsterPremiumIndex: Decodable {
    /// 交易对
    public let symbol: String
    
    /// 标记价格
    public let markPrice: String
    
    /// 指数价格
    public let indexPrice: String
    
    /// 预估结算价（仅在交割前最后一小时有意义）
    public let estimatedSettlePrice: String
    
    /// 最近更新的资金费率
    public let lastFundingRate: String
    
    /// 下次资金费时间（毫秒时间戳）
    public let nextFundingTime: Int64
    
    /// 标的资产基础利率
    public let interestRate: String
    
    /// 更新时间（毫秒时间戳）
    public let time: Int64
}
