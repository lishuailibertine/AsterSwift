//
//  AsterAccountAction.swift
//  AsterSwift
//
//  Created by li shuai on 2025/10/9.
//
import Foundation
public struct AsterAccountAction: AsterBaseAction {
    public var timestamp: Int
    public init(timestamp: Int = Int(Date().timeIntervalSince1970 * 1000)) {
        self.timestamp = timestamp
    }
}

public struct AsterLeverageBracket: AsterBaseAction {
    public var timestamp: Int
    public init(timestamp: Int = Int(Date().timeIntervalSince1970 * 1000)) {
        self.timestamp = timestamp
    }
}
