//
//  AsterV1Exchange.swift
//  AsterSwift
//
//  Created by li shuai on 2025/10/10.
//
import Foundation
import Alamofire
public class AsterKeyExchange{
    public let url: String
    public let dappUrl: String
    public let sUrl: String
    public let apikey: String
    public let apiSecret: String
    public init(url: String = "https://fapi.asterdex.com",
                dappUrl: String = "https://www.asterdex.com",
                sUrl: String = "https://sapi.asterdex.com", apikey: String, apiSecret: String) {
        self.url = url
        self.dappUrl = dappUrl
        self.sUrl = sUrl
        self.apikey = apikey
        self.apiSecret = apiSecret
    }

    public func getNonce(action: AsterGetNonce) async throws -> Int {
        let param = try action.payload()
        return try await self._postAction(request: param, url: sUrl, path: "/api/v1/getNonce", encoding: URLEncoding.default)
    }
    
    public func creatKey(action: AsterKeyAction) async throws -> AsterCreateApiKeyResponse {
        let param = try action.payload()
        return try await self._postAction(request: param, url: sUrl, path: "/api/v1/createApiKey", encoding: URLEncoding.default)
    }
    
    public func exchangeInfo() async throws -> AsterExchangeInfo {
        return try await self._getAction(request: [:], url: url, path: "/fapi/v1/exchangeInfo")
    }
    
    public func quoteVolume(symbol: String) async throws -> AsterTicker24hr {
        let response: AsterTicker24hr = try await self._getAction(request: [:], url: dappUrl, path: "/fapi/v1/ae/ticker/24hr?\(queryString(payload: ["symbol": symbol], sign: false))")
        return response
    }
    
    public func openInterest(symbol: String) async throws -> AsterMarketTicker? {
        let response: AsterDAPPResponse<[AsterMarketTicker]> = try await self._getAction(request: [:], url: dappUrl, path: "/bapi/future/v1/public/future/aster/ticker/pair?\(queryString(payload: ["symbol": symbol], sign: false))")
        return response.data.first(where: {$0.symbol.lowercased() == symbol.lowercased()})
    }
    
    public func premiumIndex(symbol: String) async throws -> AsterPremiumIndex{
        return try await self._getAction(request: [:], url: url, path: "/fapi/v1/premiumIndex?\(queryString(payload: ["symbol": symbol], sign: false))")
    }
    
    public func klines(action: AsterKlineAction) async throws -> [AsterKline] {
        let param = try action.payload()
        return try await self._getAction(request: [:], url: url, path: "/fapi/v1/klines?\(queryString(payload: param, sign: false))")
    }
    
    public func leverageBracket(action: AsterLeverageBracket = AsterLeverageBracket()) async throws -> [AsterBrackets] {
        let param = try action.payload()
        return try await self._getAction(request: [:], url: url, path: "/fapi/v1/leverageBracket?\(queryString(payload: param))")
    }
    
    public func logos() async throws -> [AsterLogo] {
        let response: AsterDAPPResponse<[AsterLogo]> = try await self._postAction(request: [:], url: dappUrl, path: "/bapi/futures/v1/public/future/asset/ae/all-asset-logo")
        return response.data
    }
    
    public func positionSide(action: AsterPositionSideAction = AsterPositionSideAction()) async throws -> AsterPositionSide {
        let param = try action.payload()
        return try await self._getAction(request: [:], url: url, path: "/fapi/v1/positionSide/dual?\(queryString(payload: param))")
    }
    
    public func account(action: AsterAccountAction = AsterAccountAction()) async throws -> AsterAccountInfoV3 {
        let param = try action.payload()
        return try await self._getAction(request: [:], url: url, path: "/fapi/v4/account?\(queryString(payload: param))")
    }
    
    public func positions(action: AsterPositionAction) async throws -> [AsterPosition] {
        let param = try action.payload()
        return try await self._getAction(request: [:], url: url, path: "/fapi/v2/positionRisk?\(queryString(payload: param))")
    }
    
    public func commissionRate(action: AsterRateAction) async throws -> AsterCommissionRate {
        let param = try action.payload()
        return try await self._getAction(request: [:], url: url, path: "/fapi/v1/commissionRate?\(queryString(payload: param))")
    }
    
    public func order(action: AsterOrderAction) async throws -> AsterResponseResultOrError<AsterOrderResponse> {
        var param = try action.payload()
        param["signature"] = self.signature(payload: param)
        return try await self._postAction(request: param, url: url, path: "/fapi/v1/order")
    }
    
    public func changeLeverage(action: AsterPositionLeverageAction) async throws -> AsterPositionLeverage{
        var param = try action.payload()
        param["signature"] = self.signature(payload: param)
        return try await self._postAction(request: param, url: url, path: "/fapi/v1/leverage")
    }
    
    public func estimateFee(action: AsterSpotEstimateFeeAction) async throws -> AsterWithdrawFee{
        let param = try action.payload()
        return try await self._getActionNokey(request: [:], url: sUrl, path: "/api/v1/aster/withdraw/estimateFee?\(queryString(payload: param, sign: false))")
    }
    
    public func withdraw(model: AsterWithdrawModel, onRequestReady: ((AsterWithdrawModel) throws -> Data)) async throws -> AsterWithdrawResponse {
        var _model = model
        let millis = Int(Date().timeIntervalSince1970 * 1000)
        let withdrawNonce = "\(millis)000"
        _model.nonce = withdrawNonce
        var withdrawAction = AsterSpotAction(withdraw: _model, timestamp: millis)
        withdrawAction.userSignature = try onRequestReady(_model).toHexString()
        var param = try withdrawAction.payload()
        param["signature"] = self.signature(payload: param)
        return try await self._postAction(request: param, url: sUrl, path: "/api/v1/aster/user-withdraw")
    }
    
    public func openOrders(action: AsterOpenOrdersAction) async throws -> [AsterFuturesOrder] {
        let param = try action.payload()
        return try await self._getAction(request: [:], url: url, path: "/fapi/v1/openOrders?\(queryString(payload: param))")
    }
    
    private func _postAction<T: Decodable> (request: [String: Any], url: String, path: String, encoding: ParameterEncoding = POSTParameterEncoder()) async throws -> T {
        let dataTask = AF.request(
            "\(url)\(path)",
            method: .post,
            parameters: request,
            encoding: encoding,
            headers: [
                "Content-Type": "application/x-www-form-urlencoded",
                "X-MBX-APIKEY": self.apikey,
            ]
        ).serializingDecodable(T.self)
        return try await dataTask.value
    }
    
    private func _getAction<T: Decodable> (request: [String: Any], url: String, path: String, encoding: ParameterEncoding = URLEncoding.default) async throws -> T {
        let dataTask = AF.request(
            "\(url)\(path)",
            method: .get,
            parameters: request,
            encoding: encoding,
            headers: [
                "Content-Type": "application/x-www-form-urlencoded",
                "X-MBX-APIKEY": self.apikey
            ],
        ).serializingDecodable(T.self)
        return try await dataTask.value
    }
    
    private func _getActionNokey<T: Decodable> (request: [String: Any], url: String, path: String, encoding: ParameterEncoding = URLEncoding.default) async throws -> T {
        let dataTask = AF.request(
            "\(url)\(path)",
            method: .get,
            parameters: request,
            encoding: encoding,
            headers: [
                "Content-Type": "application/json",
            ],
        ).serializingDecodable(T.self)
        return try await dataTask.value
    }
    
    private func queryString(payload: [String: Any], sign: Bool = true) -> String {
        let sortedString = payload.sorted { $0.key < $1.key }
                                .map { "\($0.key)=\($0.value)" }
                                .joined(separator: "&")
        if sign {
            let signature = sortedString.hmacSHA256(key: self.apiSecret)
            return "\(sortedString)&signature=\(signature)"
        } else {
            return sortedString
        }
    }
    
    private func signature(payload: [String: Any]) -> String {
        let sortedString = payload.sorted { $0.key < $1.key }
                                .map { "\($0.key)=\($0.value)" }
                                .joined(separator: "&")
        return sortedString.hmacSHA256(key: self.apiSecret)
    }
}

public struct POSTParameterEncoder: ParameterEncoding {
    public func encode(_ urlRequest: Alamofire.URLRequestConvertible,
                       with parameters: Alamofire.Parameters?) throws -> URLRequest {
        var request = try urlRequest.asURLRequest()
        guard request.httpMethod == "POST",
              let parameters = parameters else {
            return request
        }
        let signatureValue = parameters["signature"]
        let paramsWithoutSignature = parameters.filter { $0.key != "signature" }
        let sortedParams = paramsWithoutSignature.sorted { $0.key < $1.key }
        var bodyComponents = sortedParams.map { key, value in
            let encodedKey = "\(key)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? key
            let encodedValue = "\(value)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "\(value)"
            return "\(encodedKey)=\(encodedValue)"
        }
        if let sig = signatureValue {
            let encodedSig = "signature=\(sig)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "signature=\(sig)"
            bodyComponents.append(encodedSig)
        }
        let bodyString = bodyComponents.joined(separator: "&")
        request.httpBody = bodyString.data(using: .utf8)
        return request
    }
}
