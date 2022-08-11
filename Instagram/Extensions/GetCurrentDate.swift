//
//  GetCurrentDate.swift
//  Instagram
//
//  Created by Adarsh Pandey on 10/08/22.
//

import Foundation
extension Date {
    static func getCurrentDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter.string(from: Date())
    }
}
