//
//  AsterApiTest.swift
//  AsterSwift
//
//  Created by li shuai on 2025/10/9.
//

import Foundation
public struct AsterApiTest: AsterBaseAction {
    public let symbol: String = "SANDUSDT"
    public let side: String = "BUY"
    public let type: String = "LIMIT"
    public let orderId: Int = 2194215
    public var recvWindow: Int = 50000
    public var timestamp: Int = 1749545309665
}
