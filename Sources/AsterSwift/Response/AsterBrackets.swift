//
//  AsterBrackets.swift
//  AsterSwift
//
//  Created by li shuai on 2025/10/19.
//
import Foundation

public struct AsterBrackets: Decodable {
    public let symbol: String
    public let brackets: [AsterBracket]
}

public struct AsterBracket: Decodable {
    public let bracket: Int
    public let initialLeverage: Int
    public let notionalCap: Int
    public let notionalFloor: Int
    public let maintMarginRatio: Double
}
