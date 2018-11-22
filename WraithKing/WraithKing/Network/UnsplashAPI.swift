//
//  UnsplashAPI.swift
//  WraithKing
//
//  Created by lmcmz on 22/11/18.
//  Copyright © 2018 lmcmze. All rights reserved.
//

import Foundation
import Moya

let ACCESS_KEY = "1596b7800ffb5917e6bb77eba9f3be3d77f418cd442228685c84624e55dc3f02"
let SCRECT_KEY = "11ef6f18e2bbc572d82cfa39acf882fad0bf536de4553d9ce09589a1195a25d1"

// MARK: - Provider setup

private func JSONResponseDataFormatter(_ data: Data) -> Data {
    do {
        let dataAsJSON = try JSONSerialization.jsonObject(with: data)
        let prettyData =  try JSONSerialization.data(withJSONObject: dataAsJSON, options: .prettyPrinted)
        return prettyData
    } catch {
        return data // fallback to original data if it can't be serialized.
    }
}

let unsplashProvider = MoyaProvider<unsplash>(plugins: [NetworkLoggerPlugin(verbose: true, responseDataFormatter: JSONResponseDataFormatter)])

// MARK: - Provider support

private extension String {
    var urlEscaped: String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
}

public enum unsplash {
    case photos()
//    case date(String)
    
}

extension unsplash: TargetType {
    public var baseURL: URL { return URL(string: "https://api.unsplash.com")! }
    public var path: String {
        switch self {
        case .photos():
            return "/photos"
        }
    }
    
    public var method: Moya.Method {
        return .get
    }
    
    public var task: Task {
        switch self {
        case .photos():
            return .requestParameters(parameters: ["client_id": ACCESS_KEY], encoding: URLEncoding.default)
//        default:
//            return .requestPlain
        }
    }
    public var validate: Bool {
        switch self {
        case .photos():
            return true
//        default:
//            return false
        }
    }
    public var sampleData: Data {
        switch self {
        case .photos():
            return "Half measures are as bad as nothing at all.".data(using: String.Encoding.utf8)!
//        case .date(let name):
//            return "{\"login\": \"\(name)\", \"id\": 100}".data(using: String.Encoding.utf8)!
        }
    }
    public var headers: [String: String]? {
        return nil
    }
}

public func url(_ route: TargetType) -> String {
    return route.baseURL.appendingPathComponent(route.path).absoluteString
}

// MARK: - Response Handlers

extension Moya.Response {
    func mapNSArray() throws -> NSArray {
        let any = try self.mapJSON()
        guard let array = any as? NSArray else {
            throw MoyaError.jsonMapping(self)
        }
        return array
    }
}

