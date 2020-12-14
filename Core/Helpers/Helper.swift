//
//  Helper.swift
//  WChat
//
//  Created by Mohamed Adel on 7/4/20.
//  Copyright © 2020 Mohamed Adel. All rights reserved.
//

import UIKit

public class Helper
{
    // MARK: Init
    
    public static let instance = Helper()
    private init() {}
    
    // MARK: Self Defined Methods
    
    func delayWithSeconds(_ seconds: Double, completion: @escaping () -> ())
    {
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            completion()
        }
    }

    func getDeviceUUID() -> String
    {
        let identifier = UIDevice.current.identifierForVendor?.uuidString ?? "UUID"
        return identifier
    }
    
    func getYoutubeId(from url: String) -> String?
    {
        return URLComponents(string: url)?.queryItems?.first(where: { $0.name == "v" })?.value
    }
    
    func dialNumber(_ number: String)
    {
        if let url = URL(string: "tel://\(number)"),
            UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url, options: [:], completionHandler:nil)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
}
