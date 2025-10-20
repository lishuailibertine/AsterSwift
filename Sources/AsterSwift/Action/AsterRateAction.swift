//
//  AsterRateAction.swift
//  AsterSwift
//
//  Created by li shuai on 2025/10/13.
//
import Foundation
public struct AsterRateAction: AsterBaseAction {
    public var symbol: String
    public var recvWindow: Int?
    public var timestamp: Int
    public init(symbol: String, recvWindow: Int? = nil, timestamp: Int = Int(Date().timeIntervalSince1970 * 1000)) {
        self.symbol = symbol
        self.recvWindow = recvWindow
        self.timestamp = timestamp
    }
}
