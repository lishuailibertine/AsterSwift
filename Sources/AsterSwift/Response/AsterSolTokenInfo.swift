//
//  AsterSolTokenInfo.swift
//  AsterSwift
//
//  Created by li shuai on 2025/10/22.
//
import Foundation
// 每个 token 的信息
public struct AsterSolTokenInfo: Decodable {
    public let name: String
    public let displayName: String
    public let contractAddress: String
    public let decimals: Int
    public let network: String
    public let chainId: Int
    public let depositType: String
    public let rank: Int
    public let isNative: Bool
    public let admin: String?
    public let bank: String?
    public let tokenVaultAuthority: String?
    public let tokenVault: String?
    public let tokenMint: String
    public let associatedTokenProgram: String
    public let tokenProgram: String
    public let systemProgram: String
    public let ixSysvar: String
    public let priceFeed: String?
    public let priceFeedProgram: String
    public let solVault: String?
}
