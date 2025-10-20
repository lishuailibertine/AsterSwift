//
//  AsterRequestConvertible.swift
//  AsterSwift
//
//  Created by li shuai on 2025/9/26.
//

import Foundation

public protocol AsterBaseAction: AsterParamsConvertible {
    var timestamp: Int { get }
}

public protocol AsterParamsConvertible: Encodable{
    func payload() throws -> [String: Any]
    func toSignedDictionary() -> [String: String]
    func sortedJSONString() -> String
}

extension AsterParamsConvertible {
    public func payload() throws -> [String: Any] {
        let data = try JSONEncoder().encode(self)
        let object = try JSONSerialization.jsonObject(with: data, options: [])
        guard let dict = object as? [String: Any] else {
            return [:]
        }
        return dict
    }
    
    public func toSignedDictionary() -> [String: String] {
        guard let dict = try? payload() else {
            return [:]
        }
        func normalize(_ value: Any) -> String {
            if let arr = value as? [Any] {
                let newArr = arr.map { normalize($0) }
                if let data = try? JSONSerialization.data(withJSONObject: newArr),
                   let str = String(data: data, encoding: .utf8) {
                    return str
                }
            } else if let subDict = value as? [String: Any] {
                let normalized = subDict.mapValues { normalize($0) }
                if let data = try? JSONSerialization.data(withJSONObject: normalized),
                   let str = String(data: data, encoding: .utf8) {
                    return str
                }
            }
            return "\(value)"
        }

        var result: [String: String] = [:]
        for (key, value) in dict {
            result[key] = normalize(value)
        }
        return result
    }
    
    public func sortedJSONString() -> String {
        let dict = toSignedDictionary()
        return dict.toASCIISortedJSONString()
    }
}

extension Dictionary where Key == String, Value == String {
    public func toASCIISortedJSONString() -> String {
        if let data = try? JSONSerialization.data(withJSONObject: self, options: [.sortedKeys]),
           let jsonStr = String(data: data, encoding: .utf8) {
            return jsonStr
                .replacingOccurrences(of: " ", with: "")
                .replacingOccurrences(of: "\'", with: "\"")
        }
        return "{}"
    }
}
