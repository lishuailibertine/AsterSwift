//
//  AsterWithdrawFee.swift
//  AsterSwift
//
//  Created by li shuai on 2025/10/19.
//
import Foundation
public struct AsterWithdrawFee: Decodable {
    public var gasLimit: Decimal
    public var tokenPrice: Decimal
    public var gasCost: Decimal
    public var gasUsdValue: Decimal
}
