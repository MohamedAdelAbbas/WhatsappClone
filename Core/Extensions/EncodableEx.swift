//
//  EncodableExtensions.swift
//  WChat
//
//  Created by Mohamed Adel on 7/4/20.
//  Copyright © 2020 Mohamed Adel. All rights reserved.
//

import Foundation

extension Encodable
{
    func toJSONData() -> Data
    {
        let data = try? JSONEncoder().encode(self)
        return data ?? Data()
    }
    
    func toJSONString() -> String
    {
        let string = String(data: self.toJSONData(), encoding: String.Encoding.utf8) ?? ""
        return string
    }
    
    func toJSONObject() -> [String: Any]
    {
        let jsonObject = try? JSONSerialization.jsonObject(with: self.toJSONData(), options: []) as? [String: Any]
        return jsonObject ?? [:]
    }
}
