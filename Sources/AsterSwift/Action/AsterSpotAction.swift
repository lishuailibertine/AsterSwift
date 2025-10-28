//
//  AsterSpotAction.swift
//  AsterSwift
//
//  Created by li shuai on 2025/10/19.
//
import Foundation
import web3swift

public struct AsterWithDrawAction: AsterBaseAction {
    public var amount: String
    public var asset: String
    public var chainId: Int
    public var fee: String
    public var nonce: String?
    public var receiver: String
    public var userSignature: String?
    public var timestamp: Int
    public init(withdraw: AsterWithdrawModel, userSignature: String? = nil, timestamp: Int) {
        self.amount = withdraw.amount
        self.asset = withdraw.token
        self.fee = withdraw.fee
        self.nonce = withdraw.nonce
        self.receiver = withdraw.destination
        self.chainId = withdraw.chainId
        self.userSignature = userSignature
        self.timestamp = timestamp
    }
}

public struct AsterWithdrawModel {
    public var destination: String
    public var destinationChain: String
    public var chainId: Int
    public var token: String
    public var amount: String
    public var fee: String
    public var nonce: String?
    public var asterChain: String
    public init(destination: String, destinationChain: String, chainId: Int, token: String, amount: String, fee: String, nonce: String? = nil, asterChain: String) {
        self.destination = destination
        self.destinationChain = destinationChain
        self.chainId = chainId
        self.token = token
        self.amount = amount
        self.fee = fee
        self.nonce = nonce
        self.asterChain = asterChain
    }
}
extension AsterKeychain {
    public func generateSignature(model: AsterWithdrawModel) throws -> Data {
        let value = AsterKeychain.value(model: model)
        let structured_data = AsterKeychain.payload(value: value, chainId: model.chainId)
        let signed = try self.signV1(structured_data: structured_data)
        return signed
    }
    
    public func signV1(structured_data: [String: Any]) throws -> Data {
        let typedData = try makeEIP712TypedData(from: structured_data)
        return try self.signMessage(typedData, isHash: true)
    }
    
    public func makeEIP712TypedData(from dict: [String: Any]) throws -> Data {
        let data = try JSONSerialization.data(withJSONObject: dict, options: [])
        let decoder = JSONDecoder()
        let eip712TypedData = try decoder.decode(EIP712TypedData.self, from: data)
        return try eip712TypedData.digestData()
    }
    
    public static func value(model: AsterWithdrawModel) -> [String: String] {
        return [
            "type": "Withdraw",
            "destination": model.destination,
            "destination Chain": model.destinationChain,
            "token": model.token,
            "amount": model.amount,
            "fee": model.fee,
            "nonce": model.nonce!,
            "aster chain": model.asterChain
        ]
    }
   
    public static func payload(value: [String: Any], chainId: Int) -> [String: Any] {
        return [
            "domain": [
                "name": "Aster",
                "version": "1",
                "chainId": chainId,
                "verifyingContract": "0x0000000000000000000000000000000000000000"
            ],
            "types": [
                "Action": [
                    ["name": "type", "type": "string"],
                    ["name": "destination", "type": "address"],
                    ["name": "destination Chain", "type": "string"],
                    ["name": "token", "type": "string"],
                    ["name": "amount", "type": "string"],
                    ["name": "fee", "type": "string"],
                    ["name": "nonce", "type": "uint256"],
                    ["name": "aster chain", "type": "string"]
                ],
                "EIP712Domain": [
                    ["name": "name", "type": "string"],
                    ["name": "version", "type": "string"],
                    ["name": "chainId", "type": "uint256"],
                    ["name": "verifyingContract", "type": "address"]
                ]
            ],
            "primaryType": "Action",
            "message": value
        ]
    }
}
