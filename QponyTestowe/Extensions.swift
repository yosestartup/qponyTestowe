//
//  Extensions.swift
//  QponyTestowe
//
//  Created by Oleksandr Bambulyak on 15/03/2020.
//  Copyright © 2020 Oleksandr Bambulyak. All rights reserved.
//

import Foundation

extension Date {
    init(_ dateString:String) {
        let dateStringFormatter = DateFormatter()
        dateStringFormatter.dateFormat = "yyyy-MM-dd"
        dateStringFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale
        let date = dateStringFormatter.date(from: dateString)!
        self.init(timeInterval:0, since:date)
    }
}
