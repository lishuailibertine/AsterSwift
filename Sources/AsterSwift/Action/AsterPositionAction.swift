//
//  AsterPositionAction.swift
//  AsterSwift
//
//  Created by li shuai on 2025/10/19.
//
import Foundation
public struct AsterPositionAction: AsterBaseAction {
    public var timestamp: Int
    public var symbol: String
    public init(symbol: String, timestamp: Int = Int(Date().timeIntervalSince1970 * 1000)) {
        self.symbol = symbol
        self.timestamp = timestamp
    }
}
