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
        static let dateLabel: UIColor = .dateLabel
        static let errorLoadFeedLabel: UIColor = .errorLoadFeedLabel
    }
    
    enum FontSize {
        static let underlineErrorLabel: CGFloat = 12
        static let buttonTitle: CGFloat = 16
        static let titleLabelCell: CGFloat = 12
        static let titleLabelDetailVC: CGFloat = 16
        static let dateLabelDetailVC: CGFloat = 10
        static let descriptionLabelDetailVC: CGFloat = 12
        static let errorLoadFeedLabel: CGFloat = 14
    }
    
    enum Text {
        static let titleLoginVC = "Вход"
        static let titleHomeVC = "Главная"
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
    
    
    enum MockData {
        enum MockImage: String {
            case img1, img2, img3, img4, img5, img6, img7, img8, img9, img10
        }
        
        static let mockTitle = "Lorem ipsum dolor sit amet"
        static let mockDescription = "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet."
    }
    
}
