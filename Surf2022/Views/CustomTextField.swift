//
//  CustomTextField.swift
//  Surf2022
//
//  Created by Алексей on 24.06.2024.
//

import UIKit

final class CustomTextField: UITextField {

    var rightViewPadding: CGFloat = 0

    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        var rightViewRect = super.rightViewRect(forBounds: bounds)
        rightViewRect.origin.x -= rightViewPadding
        return rightViewRect
    }
}
