//
//  AsterSolTokenInfo.swift
//  AsterSwift
//
//  Created by li shuai on 2025/10/22.
//
import Foundation
// 每个 token 的信息
public struct AsterSolTokenInfo: Decodable {
    let name: String
    let displayName: String
    let contractAddress: String
    let decimals: Int
    let network: String
    let chainId: Int
    let depositType: String
    let rank: Int
    let isNative: Bool
    let admin: String?
    let bank: String?
    let tokenVaultAuthority: String?
    let tokenVault: String?
    let tokenMint: String
    let associatedTokenProgram: String
    let tokenProgram: String
    let systemProgram: String
    let ixSysvar: String
    let priceFeed: String?
    let priceFeedProgram: String
    let solVault: String?
}
