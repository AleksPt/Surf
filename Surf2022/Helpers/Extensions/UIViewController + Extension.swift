//
//  UIViewController + Extension.swift
//  Surf2022
//
//  Created by Алексей on 19.06.2024.
//

import UIKit

enum TypeErrorView {
    case incorrectAuth
    case disconnectInternet
    case errorLogout
}

extension UIViewController {
    /// Скрывает клавиатуру тапом по экрану
    func addTapGestureToHideKeyboard() {
        let tapGesture = UITapGestureRecognizer(
            target: self,
            action: #selector(UIViewController.dismissKeyboard)
        )
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
    
    /// Показывает view  с ошибкой в safeArea.top
    func showErrorView(withTypeError: TypeErrorView) {
        let colouredTopBlack = UIView()
        colouredTopBlack.backgroundColor = .myRed
        
        let label = UILabel()
        colouredTopBlack.addSubview(label)
        label.font = .systemFont(ofSize: 14)
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        switch withTypeError {
        case .incorrectAuth:
            label.text = K.Text.incorrectAuth
        case .disconnectInternet:
            label.text = K.Text.disconnectInternet
        case .errorLogout:
            label.text = K.Text.errorLogout
        }
        
        if let window = UIApplication.shared.windows.first(where: { $0.isKeyWindow }) {
            colouredTopBlack.frame = CGRect(
                x: 0,
                y: -93,
                width: window.frame.width,
                height: 93
            )
            window.addSubview(colouredTopBlack)
        }
        
        NSLayoutConstraint.activate([
            label.bottomAnchor.constraint(equalTo: colouredTopBlack.bottomAnchor, constant: withTypeError == .disconnectInternet ? -8 : -16),
            label.centerXAnchor.constraint(equalTo: colouredTopBlack.centerXAnchor),
        ])
        
        UIView.animate(withDuration: 0.5) {
            colouredTopBlack.frame = colouredTopBlack.frame.offsetBy(dx: 0, dy: 93)
        } completion: { _ in
            UIView.animate(withDuration: 0.5, delay: 1.25) {
                colouredTopBlack.frame = colouredTopBlack.frame.offsetBy(dx: 0, dy: -93)
            } completion: { _ in
                colouredTopBlack.removeFromSuperview()
            }
        }
    }
}
