//
//  AsterApiKeyResponse.swift
//  AsterSwift
//
//  Created by li shuai on 2025/10/19.
//
import Foundation
public struct AsterCreateApiKeyResponse: Decodable {
    public let apiKey: String
    public let apiSecret: String
}
