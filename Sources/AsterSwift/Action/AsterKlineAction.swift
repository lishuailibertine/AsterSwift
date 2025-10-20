//
//  AsterKlineAction.swift
//  AsterSwift
//
//  Created by li shuai on 2025/10/19.
//
import Foundation
public struct AsterKlineAction: AsterParamsConvertible {
    public var symbol: String
    public var interval: String
    public var startTime: Int64
    public var endTime: Int64
    public init(symbol: String, interval: String, startTime: Int64, endTime: Int64) {
        self.symbol = symbol
        self.interval = interval
        self.startTime = startTime
        self.endTime = endTime
    }
}
