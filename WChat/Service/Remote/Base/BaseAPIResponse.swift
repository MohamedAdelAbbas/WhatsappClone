//
//  BaseModels.swift
//  WChat
//
//  Created by Mohamed Adel on 7/4/20.
//  Copyright © 2020 Mohamed Adel. All rights reserved.
//

import Foundation

struct BaseAPIResponse<Data: Codable>: Codable
{
    let status : Bool?
    let msg: String?
    let data : Data?
    
    enum CodingKeys: String, CodingKey
    {
        case status = "status"
        case msg = "msg"
        case data = "data"
    }
}
