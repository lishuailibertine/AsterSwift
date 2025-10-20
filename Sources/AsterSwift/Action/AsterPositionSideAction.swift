//
//  AsterPositionSideAction.swift
//  AsterSwift
//
//  Created by li shuai on 2025/10/14.
//
import Foundation

public struct AsterPositionSideAction: AsterBaseAction {
    public var timestamp: Int
    public init(timestamp: Int = Int(Date().timeIntervalSince1970 * 1000)) {
        self.timestamp = timestamp
    }
}
