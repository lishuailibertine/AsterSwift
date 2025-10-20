//
//  AsterKeyAction.swift
//  AsterSwift
//
//  Created by li shuai on 2025/10/19.
//
import Foundation
public struct AsterKeyAction: AsterBaseAction {
    public var userOperationType: String
    public var userSignature: String
    public var address: String
    public var desc: String
    public var timestamp: Int
    public init(userOperationType: String, userSignature: String, address: String, desc: String) {
        self.userOperationType = userOperationType
        self.userSignature = userSignature
        self.address = address
        self.desc = desc
        self.timestamp = Int(Date().timeIntervalSince1970 * 1000)
    }
}
