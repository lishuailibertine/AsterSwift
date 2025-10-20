//
//  AsterPositionLeverage.swift
//  AsterSwift
//
//  Created by li shuai on 2025/10/19.
//
import Foundation

public struct AsterPositionLeverage: Decodable {
    public let leverage: Int
    public let maxNotionalValue: String
    public let symbol: String
}
