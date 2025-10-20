//
//  AsterRequest.swift
//  AsterSwift
//
//  Created by li shuai on 2025/9/26.
//
import Foundation
import web3swift
import CryptoSwift

public struct AsterRequest: AsterParamsConvertible{
    public var nonce: Int
    public var user: String
    public var signer: String
    public var signature: AsterSignature?
    public var action: AsterBaseAction
    public init(nonce: Int = Int(Date().timeIntervalSince1970 * 1_000_000), user: String, signer: String, signature: AsterSignature? = nil, action: AsterBaseAction) {
        self.nonce = nonce
        self.user = user
        self.signer = signer
        self.signature = signature
        self.action = action
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(nonce, forKey: .nonce)
        try container.encode(user, forKey: .user)
        try container.encode(signer, forKey: .signer)
        if let signature = signature {
            try container.encode(signature.signatureData()?.toHexString(), forKey: .signature)
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case nonce
        case user
        case signer
        case signature
    }
}
