//
//  AsterResponse.swift
//  AsterSwift
//
//  Created by li shuai on 2025/9/26.
//
public struct AsterDAPPResponse<T: Decodable>: Decodable {
    public let data: T
}
public struct AsterResponseError: Decodable {
    public let code: Int
    public let msg: String?
}

public enum AsterResponseResultOrError<T: Decodable>: Decodable {
    case result(T)
    case error(AsterResponseError)
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let error = try? container.decode(AsterResponseError.self) {
            self = .error(error)
        } else if let result = try? container.decode(T.self) {
            self = .result(result)
        } else {
            throw DecodingError.typeMismatch(
                AsterResponseResultOrError.self,
                DecodingError.Context(
                    codingPath: decoder.codingPath,
                    debugDescription: "AsterResponseResultOrError"
                )
            )
        }
    }
}
