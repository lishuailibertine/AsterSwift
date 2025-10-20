//
//  AsterPositionLeverageAction.swift
//  AsterSwift
//
//  Created by li shuai on 2025/10/19.
//

import Foundation
public struct AsterPositionLeverageAction: AsterBaseAction {
    public var timestamp: Int
    public var leverage: Int
    public var symbol: String
    public init(symbol: String, leverage: Int) {
        self.symbol = symbol
        self.leverage = leverage
        self.timestamp = Int(Date().timeIntervalSince1970 * 1000)
    }
}

