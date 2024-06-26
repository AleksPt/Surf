//
//  ViewController.swift
//  Surf2022
//
//  Created by Алексей on 19.06.2024.
//

import UIKit
import SnapKit

final class LoginViewController: UIViewController {
    
    // MARK: - UI
    private let loginTextField = UITextField(
        placeholder: K.Text.loginTextFieldPlaceholder
    )
    
    private lazy var underlineLogin: UIView = {
        let element = UIView()
        element.backgroundColor = K.Colors.dfdfdf
        return element
    }()
    
    private lazy var loginUnderlineErrorLabel: UILabel = {
        let element = UILabel()
        element.isHidden = true
        element.text = K.Text.Error.fieldIsEmpty
        element.textColor = .systemRed
        element.font = UIFont(name: K.Font.regular, size: K.FontSize.size12)
        return element
    }()
    
    private let passwordTextField = CustomTextField(placeholder: K.Text.passwordTextFieldPlaceholder, isSecure: true)
    
    private lazy var underlinePassword: UIView = {
        let element = UIView()
        element.backgroundColor = K.Colors.dfdfdf
        return element
    }()
    
    private lazy var passwordUnderlineErrorLabel: UILabel = {
        let element = UILabel()
        element.isHidden = true
        element.text = K.Text.Error.fieldIsEmpty
        element.textColor = .systemRed
        element.font = UIFont(name: K.Font.regular, size: K.FontSize.size12)
        return element
    }()
    
    private let authButton = UIButton(
        text: K.Text.Button.login,
        size: K.FontSize.size16,
        weight: .semibold
    )
    
    private lazy var logoSurf: UIImageView = {
        let element = UIImageView()
        element.image = K.Image.surfLogo
        element.contentMode = .scaleAspectFit
        return element
    }()
    
    private lazy var eyeButton: UIButton = {
        let element = UIButton(type: .system)
        element.setBackgroundImage(K.Image.eyeClosed, for: .normal)
        return element
    }()
    
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let element = UIActivityIndicatorView()
        element.color = .white
        return element
    }()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        setDelegates()
    }
    
    // MARK: - Private methods
    private func setDelegates() {
        loginTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    private func updateConstraints(login: Bool, password: Bool) {
        guard login else {
            passwordTextField.snp.updateConstraints {
                $0.top.equalTo(loginTextField.snp.bottom).offset(
                    K.Constraints.topPasswordTextFieldNew)
            }
            return
        }
        
        guard password else {
            passwordTextField.snp.updateConstraints {
                $0.top.equalTo(loginTextField.snp.bottom).offset(
                    K.Constraints.topPasswordTextField)
            }
            authButton.snp.updateConstraints {
                $0.top.equalTo(passwordTextField.snp.bottom).offset(
                    K.Constraints.topAuthButtonNew)
            }
            return
        }
        
        passwordTextField.snp.updateConstraints {
            $0.top.equalTo(loginTextField.snp.bottom).offset(
                K.Constraints.topPasswordTextField)
        }
        authButton.snp.updateConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(
                K.Constraints.topAuthButton)
        }
    }
    
    private func updateUiTextFields(login: Bool, password: Bool) {
        guard login else {
            loginUnderlineErrorLabel.isHidden = false
            underlineLogin.backgroundColor = K.Colors.f35858
            loginTextField.becomeFirstResponder()
            return
        }
        
        loginUnderlineErrorLabel.isHidden = true
        underlineLogin.backgroundColor = K.Colors.dfdfdf
        
        guard password else {
            passwordUnderlineErrorLabel.isHidden = false
            underlinePassword.backgroundColor = K.Colors.f35858
            passwordTextField.becomeFirstResponder()
            return
        }
        
        passwordUnderlineErrorLabel.isHidden = true
        underlinePassword.backgroundColor = K.Colors.dfdfdf
    }
    
    private func verifyInput() -> Bool {
        guard let loginText = loginTextField.text, !loginText.isEmpty else {
            updateUiTextFields(login: false, password: false)
            updateConstraints(login: false, password: false)
            return false
        }
        
        updateUiTextFields(login: true, password: false)
        
        guard let passwordText = passwordTextField.text, !passwordText.isEmpty else {
            updateUiTextFields(login: true, password: false)
            updateConstraints(login: true, password: false)
            return false
        }
        
        updateUiTextFields(login: true, password: true)
        updateConstraints(login: true, password: true)
        
        return true
    }
    
    // MARK: - Actions
    @objc private func showPassword() {
        passwordTextField.becomeFirstResponder()
        passwordTextField.isSecureTextEntry.toggle()
        eyeButton.setBackgroundImage(
            passwordTextField.isSecureTextEntry ? K.Image.eyeClosed : K.Image.eyeOpen,
            for: .normal
        )
    }
    
    @objc private func authButtonPressed() {
        guard verifyInput() else {
            return
        }
        
        NotificationCenter.default.post(
            name: Notification.Name(K.NotificationKey.login),
            object: nil,
            userInfo: [K.NotificationKey.login: true]
        )
        
        navigationController?.viewControllers.removeAll { $0 is LoginViewController }
    }
}

// MARK: - UITextFieldDelegate
extension LoginViewController: UITextFieldDelegate {
    
}

// MARK: - Setup Views
private extension LoginViewController {
    func setupViews() {
        self.addTapGestureToHideKeyboard()
        view.backgroundColor = .systemBackground
        
        view.addSubview(loginTextField)
        view.addSubview(underlineLogin)
        view.addSubview(loginUnderlineErrorLabel)
        view.addSubview(passwordTextField)
        view.addSubview(underlinePassword)
        view.addSubview(passwordUnderlineErrorLabel)
        view.addSubview(authButton)
        authButton.addSubview(activityIndicator)
        view.addSubview(logoSurf)
        
        passwordTextField.rightView = eyeButton
        passwordTextField.rightViewMode = .whileEditing
        passwordTextField.rightViewPadding = 16
        
        eyeButton.addTarget(self, action: #selector(showPassword), for: .touchUpInside)
        authButton.addTarget(self, action: #selector(authButtonPressed), for: .touchUpInside)
        
        title = K.Text.TitleVC.loginVC
        
    }
}

private extension LoginViewController {
    func setupConstraints() {
        loginTextField.snp.makeConstraints {
            $0.height.equalTo(K.Constraints.heightLoginPasswordTextField)
            $0.leading.trailing.equalToSuperview().inset(K.Constraints.leadingTrailingOffsetTextField)
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(K.Constraints.topLoginTextField)
        }
        
        underlineLogin.snp.makeConstraints {
            $0.leading.trailing.equalTo(loginTextField)
            $0.height.equalTo(K.Constraints.heightUnderline)
            $0.top.equalTo(loginTextField.snp.bottom)
        }
        
        loginUnderlineErrorLabel.snp.makeConstraints {
            $0.top.equalTo(underlineLogin.snp.bottom).offset(K.Constraints.topOffsetUnderlineErrorLabel)
            $0.leading.equalTo(loginTextField.snp.leading).offset(K.Constraints.leadingUnderlineErrorLabel)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(K.Constraints.leadingTrailingOffsetTextField)
            $0.height.equalTo(K.Constraints.heightLoginPasswordTextField)
            $0.top.equalTo(loginTextField.snp.bottom).offset(K.Constraints.topPasswordTextField)
        }
        
        underlinePassword.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom)
            $0.height.equalTo(K.Constraints.heightUnderline)
            $0.leading.trailing.equalTo(passwordTextField)
        }
        
        passwordUnderlineErrorLabel.snp.makeConstraints {
            $0.top.equalTo(underlinePassword.snp.bottom).offset(K.Constraints.topOffsetUnderlineErrorLabel)
            $0.leading.equalTo(loginUnderlineErrorLabel.snp.leading)
        }
        
        authButton.snp.makeConstraints {
            $0.leading.trailing.equalTo(loginTextField)
            $0.height.equalTo(K.Constraints.heightButton)
            $0.top.equalTo(passwordTextField.snp.bottom).offset(K.Constraints.topAuthButton)
        }
        
        logoSurf.snp.makeConstraints {
            $0.top.equalTo(authButton.snp.bottom).offset(K.Constraints.topLogoSurf)
            $0.leading.equalToSuperview()
        }
        
        activityIndicator.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
    }
}
