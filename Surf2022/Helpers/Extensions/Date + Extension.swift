//
//  Date + Extension.swift
//  Surf2022
//
//  Created by Алексей on 25.06.2024.
//

import Foundation

extension Date {
    func dateFormatter() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        return dateFormatter.string(from: self)
    }
}
