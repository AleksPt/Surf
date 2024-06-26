//
//  Constants.swift
//  Surf2022
//
//  Created by Алексей on 19.06.2024.
//

import UIKit

enum K {
    enum Image {
        static let eyeClosed: UIImage = .eyeClosed
        static let eyeOpen: UIImage = .eyeOpen
        static let back: UIImage = .back
        static let emotion: UIImage = .emotionLine
        static let heartFill: UIImage = .heartFill
        static let heartLine: UIImage = .heartLine
        static let home: UIImage = .homeLine
        static let search: UIImage = .searchEyeLine
        static let smileUnhappy: UIImage = .smileUnhappy
        static let searchLine: UIImage = .searchLine
        static let surfLogo: UIImage = .surfLogo
    }
    
    enum Colors {
        static let f35858: UIColor = .F_35858
        static let dfdfdf: UIColor = .DFDFDF
        static let b3b3b3: UIColor = .B_3_B_3_B_3
        static let b0b0b0: UIColor = .B_0_B_0_B_0
    }
    
    enum Font {
        static let regular = "SFProText-Regular"
        static let medium = "SFProText-Medium"
        static let semibold = "SFProText-Semibold"
        static let light = "SFProText-Light"
    }
    
    enum FontSize {
        static let size10: CGFloat = 10
        static let size12: CGFloat = 12
        static let size14: CGFloat = 14
        static let size16: CGFloat = 16
        static let size18: CGFloat = 18
    }
    
    enum Text {
        static let loginTextFieldPlaceholder = "Логин"
        static let passwordTextFieldPlaceholder = "Пароль"
        static let enterYourRequest = "Введите ваш запрос"
        static let profileTitleCityCell = "Город"
        static let profileTitlePhoneCell = "Телефон"
        static let profileTitleEmailCell = "Почта"
        
        enum Error {
            static let fieldIsEmpty = "Поле не может быть пустым"
            static let incorrectAuth = "Логин или пароль введен неправильно"
            static let disconnectInternet = "Отсутствует интернет-соединение\nПопробуйте позже"
            static let errorLogout = "Не удалось выйти, попробуйте еще раз"
            static let failUpdate = "Не удалось загрузить ленту\nОбновите экран или попробуйте позже"
            static let failRequest = "По этому запросу нет результатов, попробуйте другой запрос"
        }
        
        enum TitleVC {
            static let loginVC = "Вход"
            static let homeVC = "Главная"
            static let favoriteVC = "Избранное"
            static let profileVC = "Профиль"
        }
        
        enum Alert {
            static let title = "Внимание"
            static let messageFavoriteDelete = "Вы точно хотите удалить из избранного?"
            static let messageLogout = ""
            static let okButton = "Да, точно"
            static let cancelButton = "Нет"
        }
        
        enum Button {
            static let login = "Войти"
            static let update = "Обновить"
            static let logout = "Выйти"
        }
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
        static let mockDescription = "Для бариста и посетителей кофеен специальные кружки для кофе — это ещё один способ проконтролировать вкус напитка и приготовить его именно так, как нравится вам. Теперь, кроме регулировки экстракции, настройки помола, времени заваривания и многого что помогает выделять нужные характеристики кофе, вы сможете выбрать и кружку для кофе в зависимости от сорта."
    }
    
    enum NotificationKey {
        static let login = "login"
    }
}
