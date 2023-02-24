//
//  DateHelper.swift
//  DailyDoodle
//
//  Created by Lais Godinho on 23/02/23.
//

import Foundation

class DateHelper {
    static let calendar = Calendar.current

    static func getCurrentDay() -> Int {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd"
        let dayString = dateFormatter.string(from: date)
        return Int(dayString)!
    }

    static func daysInMonth(date: Date) -> Int {
        let range = calendar.range(of: .day, in: .month, for: date)!
        return range.count
    }
}
