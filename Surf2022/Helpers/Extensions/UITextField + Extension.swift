//
//  UITextField + Extension.swift
//  Surf2022
//
//  Created by Алексей on 19.06.2024.
//

import UIKit

extension UITextField {
    convenience init(placeholder: String, isSecure: Bool = false) {
        self.init()
        self.placeholder = placeholder
        self.backgroundColor = .systemGroupedBackground
        self.indent(size: 18)
        self.isSecureTextEntry = isSecure
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 10
        self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    func indent(size:CGFloat) {
        self.leftView = UIView(
            frame: CGRect(
                x: self.frame.minX,
                y: self.frame.minY,
                width: size,
                height: self.frame.height
            )
        )
        self.leftViewMode = .always
    }
}
