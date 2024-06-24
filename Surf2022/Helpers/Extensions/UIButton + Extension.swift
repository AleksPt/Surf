//
//  UIButton + Extension.swift
//  Surf2022
//
//  Created by Алексей on 19.06.2024.
//

import UIKit

extension UIButton {
    convenience init(text: String, size: CGFloat, weight: UIFont.Weight) {
        self.init(type: .system)
        self.setTitle(text, for: .normal)
        self.setTitleColor(.white, for: .normal)
        self.backgroundColor = .black
        self.titleLabel?.font = .systemFont(ofSize: size, weight: weight)
    }
}
