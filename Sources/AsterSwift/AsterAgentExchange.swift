// The Swift Programming Language
// https://docs.swift.org/swift-book
import Foundation
import web3swift
import Alamofire

public class AsterAgentExchange{
    public let url: String
    public let user: String
    public let signer: String
    public init(url: String = "https://fapi.asterdex.com", user: String, signer: String) {
        self.url = url
        self.user = user
        self.signer = signer
    }

    public func account(action: AsterAccountAction, onRequestReady: ((AsterRequest) throws -> AsterSignature)) async throws -> AsterAccountInfoV3 {
        var request = AsterRequest(user: user, signer: signer, action: action)
        request.signature = try onRequestReady(request)
        let payload = try request.payload()
        return try await self._getAction(request: payload, path: "/fapi/v3/account")
    }
    
    public func placeOrder(action: AsterBaseAction, onRequestReady: ((AsterRequest) throws -> AsterSignature)) async throws {
        var request = AsterRequest(user: user, signer: signer, action: action)
        request.signature = try onRequestReady(request)
    }
    
    private func _postAction<T: Decodable> (request: [String: Any], path: String) async throws -> T {
        let dataTask = AF.request(
            "\(url)\(path)",
            method: .post,
            parameters: request,
            encoding: JSONEncoding.default,
            headers: [
                "Content-Type": "application/x-www-form-urlencoded"
            ]
        ).serializingDecodable(T.self)
        return try await dataTask.value
    }
    
    private func _getAction<T: Decodable> (request: [String: Any],  path: String) async throws -> T {
        let dataTask = AF.request(
            "\(self.url)\(path)",
            method: .get,
            parameters: request,
            encoding: URLEncoding.default
        ).serializingDecodable(T.self)
        return try await dataTask.value
    }
}
