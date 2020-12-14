//
//  AnyLanguageBundle.swift
//  WChat
//
//  Created by Mohamed Adel on 7/4/20.
//  Copyright © 2020 Mohamed Adel. All rights reserved.
//
import Foundation

class AnyLanguageBundle: Bundle
{
    override func localizedString(forKey key: String,
                                  value: String?,
                                  table tableName: String?) -> String
    {
        guard let path = objc_getAssociatedObject(self, &Constants.bundleKey) as? String,
            let bundle = Bundle(path: path) else
        {
            return super.localizedString(forKey: key, value: value, table: tableName)
        }
        
        return bundle.localizedString(forKey: key, value: value, table: tableName)
    }
}
