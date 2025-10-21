//
//  AsterSign.swift
//  AsterSwift
//
//  Created by li shuai on 2025/9/26.
//

import Foundation
import Secp256k1Swift
import web3swift
import CryptoSwift
import BIP39swift
import BIP32Swift
import BigInt
import SolanaSwift
public enum AsterSignError: Error {
    case invalidPrivateData
    case invalidPublicData
    case signError
}
public struct AsterKeychain{
    public var privateData: Data
    public var publicData: Data
    
    public init(privateData: Data) throws {
        self.privateData = privateData
        guard let publicKey = SECP256K1.privateToPublic(privateKey: privateData, compressed: false) else {
            throw AsterSignError.invalidPrivateData
        }
        self.publicData = publicKey
    }
    
    public func signMessage(_ message: Data, isHash: Bool = false) throws -> Data {
        let _hash: Data? = isHash ? message : Web3.Utils.hashPersonalMessage(message)
        guard let hash = _hash else {
            throw AsterSignError.signError
        }
        let (compressedSignature, _) = SECP256K1.signForRecovery(hash: hash, privateKey: privateData, useExtraVer: true)
        guard let retrunSignature = compressedSignature else {
            throw AsterSignError.signError
        }
        return retrunSignature
    }
}

public struct AsterSOLKeychain{
    public var secretKey: Data
    public init(secretKey: Data) throws {
        self.secretKey = secretKey
    }
    func signMessage(raw: Data) throws -> SolanaSignature {
        return SolanaSignature(data: try SolanaKeyPair(secretKey: self.secretKey).signDigest(messageDigest: raw))
    }
}

// agent
extension AsterKeychain {
    public func signRequest(_ request: AsterRequest) throws -> String {
        return try signAction(request.action, user: request.user, signer: request.signer, nonce: request.nonce)
    }
    public func signAction(_ action: AsterBaseAction, user: String, signer: String, nonce: Int) throws -> String {
        let payload = action.sortedJSONString()
        let msg = AsterKeychain.trim_param(payload: payload, user: user, signer: signer, nonce: nonce)
        let signed_message = try self.signMessage(msg)
        return signed_message.toHexString()
    }

    public static func trim_param(payload: String, user: String, signer: String, nonce: Int) -> Data {
        let values: [AnyObject] = [
            payload as AnyObject,
            user as AnyObject,
            signer as AnyObject,
            nonce as AnyObject
        ]
        let packageData = ABIEncoder.encode(types: [
            .string,
            .address,
            .address,
            .uint(bits: 256)
        ], values: values)
        return (packageData ?? Data()).sha3(.keccak256)
    }
}

//
extension String {
    func hmacSHA256(key: String) -> String {
        let keyBytes = Array(key.utf8)
        let msgBytes = Array(self.utf8)
        let hmac = try! HMAC(key: keyBytes, variant: .sha2(.sha256)).authenticate(msgBytes)
        return hmac.toHexString()
    }
}
