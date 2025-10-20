//
//  AsterOpenOrdersAction.swift
//  AsterSwift
//
//  Created by li shuai on 2025/10/13.
//
import Foundation
public struct AsterOpenOrdersAction: AsterBaseAction {
    public var timestamp: Int
    public var symbol: String?
    public var recvWindow: Int?
    public init(timestamp: Int = Int(Date().timeIntervalSince1970 * 1000), symbol: String? = nil, recvWindow: Int? = nil) {
        self.timestamp = timestamp
        self.symbol = symbol
        self.recvWindow = recvWindow
    }
}
