//
//  Constants.swift
//  Surf2022
//
//  Created by Алексей on 19.06.2024.
//

import UIKit

enum K {
    enum Colors {
        static let red: UIColor = .myRed
        static let gray: UIColor = .myGray
    }
    
    enum FontSize {
        static let underlineErrorLabel: CGFloat = 12
        static let buttonTitle: CGFloat = 16
    }
    
    enum Text {
        static let titleLoginVC = "Вход"
        static let authButton = "Вход"
        static let loginTextFieldPlaceholder = "Логин"
        static let passwordTextFieldPlaceholder = "Пароль"
        static let underlineLabel = "Поле не может быть пустым"
        static let incorrectAuth = "Логин или пароль введен неправильно"
        static let disconnectInternet = "Отсутствует интернет-соединение\nПопробуйте позже"
        static let errorLogout = "Не удалось выйти, попробуйте еще раз"
    }
    
    enum Constraints {
        static let heightButton: CGFloat = 48
        static let topLogoSurf: CGFloat = 82.57
        
        static let topAuthButton: CGFloat = 32
        static let topAuthButtonNew: CGFloat = 55
        
        static let topOffsetUnderlineErrorLabel: CGFloat = 8
        static let leadingUnderlineErrorLabel: CGFloat = 16
        
        static let heightLoginPasswordTextField: CGFloat = 56
        static let leadingTrailingOffsetTextField: CGFloat = 16
        static let topLoginTextField: CGFloat = 24
        static let topPasswordTextField: CGFloat = 16
        static let topPasswordTextFieldNew: CGFloat = 39
        
        static let heightUnderline: CGFloat = 0.98
    }
}
