//
//  Moya+HandyJson.swift
//  WraithKing
//
//  Created by lmcmz on 22/11/18.
//  Copyright © 2018 lmcmze. All rights reserved.
//

import Foundation
import Moya
import HandyJSON

public extension Response
{
    // Data -> model
    public func mapObject<T: HandyJSON>(_ type: T.Type) -> T? {
        
        guard let dataString = String.init(data: self.data, encoding: .utf8),
            let object = JSONDeserializer<T>.deserializeFrom(json: dataString)
            else {
                return nil
        }
        
        return object
    }
    
    
    // Data -> Model Key
    public func mapObject<T: HandyJSON>(_ type: T.Type ,designatedPath: String) -> T?{
        
        guard let dataString = String(data: self.data, encoding: .utf8),
            let object = JSONDeserializer<T>.deserializeFrom(json: dataString, designatedPath: designatedPath)
            else {
                return nil
        }
        
        return object
    }
    
    // Data -> [Model]
    public func mapArray<T: HandyJSON>(_ type: T.Type)  -> [T?]? {
        
        guard let dataString = String(data: self.data, encoding: .utf8),
            let object = JSONDeserializer<T>.deserializeModelArrayFrom(json: dataString)
            else {
                return nil
        }
        return object
    }
    
    
    // Data -> Key[Model]
    public func mapArray<T: HandyJSON>(_ type: T.Type ,designatedPath: String )  -> [T?]? {
        guard let dataString = String(data: self.data, encoding: .utf8),
            let object = JSONDeserializer<T>.deserializeModelArrayFrom(json: dataString , designatedPath: designatedPath)
            else {
                return nil
        }
        return object
    }
    
}
