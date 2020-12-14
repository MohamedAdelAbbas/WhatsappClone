//
//  JSONParser.swift
//  WChat
//
//  Created by Mohamed Adel on 7/4/20.
//  Copyright © 2020 Mohamed Adel. All rights reserved.
//
import Foundation

class JSONParser
{
    static let `default` = JSONParser()
    
    private init() {}
    
    func parse<T>(from localJSONFileName: String) -> (T?, NetworkError?) where T: Codable
    {
        do
        {
            guard let localFilePath = Bundle.main.path(forResource: localJSONFileName, ofType: "json") else {
                throw NSError(domain: "\(localJSONFileName).json", code: 404, userInfo: nil)
            }
            
            let jsonString = try NSString(contentsOfFile: localFilePath, encoding: String.Encoding.utf8.rawValue)
            let jsonData = jsonString.data(using: String.Encoding.utf8.rawValue)!
            let decoder = JSONDecoder()
            let decodedData = try decoder.decode(T.self, from: jsonData)
            return (decodedData, nil)
        }
        catch let error
        {
            return (nil, NetworkError(error))
        }
    }
    
    func getJSONData(from localJSONFileName: String) -> Data?
    {
        do
        {
            guard let localFilePath = Bundle.main.path(forResource: localJSONFileName, ofType: "json") else {
                throw NSError(domain: "\(localJSONFileName).json", code: 404, userInfo: nil)
            }
            
            let jsonString = try NSString(contentsOfFile: localFilePath, encoding: String.Encoding.utf8.rawValue)
            let jsonData = jsonString.data(using: String.Encoding.utf8.rawValue)!
           
            return jsonData
        }
        catch
        {
            return nil
        }
    }
}
