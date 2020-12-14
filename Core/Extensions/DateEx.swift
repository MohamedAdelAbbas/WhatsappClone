//
//  DateExtensions.swift
//  WChat
//
//  Created by Mohamed Adel on 7/4/20.
//  Copyright © 2020 Mohamed Adel. All rights reserved.
//


import Foundation

extension Date
{
    static let normalDateFormat = "EEEE dd MMM yyyy"
    static let fullFormat: String = "EEEE dd MMM, yyyy  hh:mm:ss a"
    
    var millisecondsSince1970: Int64
    {
        return Int64((self.timeIntervalSince1970 * 1000.0).rounded())
    }
    
    static func -(recent: Date, previous: Date) -> (months: Int, days: Int, hours: Int, minutes: Int, seconds: Int)
    {
        let days = Calendar.current.dateComponents([.day], from: previous, to: recent).day ?? 0
        let months = Calendar.current.dateComponents([.month], from: previous, to: recent).month ?? 0
        let hours = Calendar.current.dateComponents([.hour], from: previous, to: recent).hour ?? 0
        let minutes = Calendar.current.dateComponents([.minute], from: previous, to: recent).minute ?? 0
        let seconds = Calendar.current.dateComponents([.second], from: previous, to: recent).second ?? 0
        
        return (months: months, days: days, hours: hours, minutes: minutes, seconds: seconds)
    }
     
    func getFormattedDate(in timeZone: TimeZone = TimeZone.current, with format: String = fullFormat) -> String
     {
         let formatter = DateFormatter()
         formatter.dateFormat = format
         formatter.timeZone = timeZone
         formatter.locale = Locale(identifier: "ar")
         return formatter.string(from: self)
     }
    
    func removeTime() -> Date
    {
        guard let date = Calendar.current.date(from: Calendar.current.dateComponents([.year, .month, .day], from: self)) else {
            fatalError("Failed to strip time from Date object")
        }
        return date
    }
}
