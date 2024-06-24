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
        element.backgroundColor = .myGray
        return element
    }()
    
    private lazy var loginUnderlineErrorLabel: UILabel = {
        let element = UILabel()
        element.isHidden = true
        element.text = K.Text.underlineLabel
        element.textColor = .systemRed
        element.font = .systemFont(ofSize: K.FontSize.underlineErrorLabel)
        return element
    }()
    
    private let passwordTextField = CustomTextField(placeholder: K.Text.passwordTextFieldPlaceholder, isSecure: true)
    
    private lazy var underlinePassword: UIView = {
        let element = UIView()
        element.backgroundColor = .myGray
        return element
    }()
    
    private lazy var passwordUnderlineErrorLabel: UILabel = {
        let element = UILabel()
        element.isHidden = true
        element.text = K.Text.underlineLabel
        element.textColor = .systemRed
        element.font = .systemFont(ofSize: K.FontSize.underlineErrorLabel)
        return element
    }()
    
    private let authButton = UIButton(
        text: K.Text.authButton,
        size: K.FontSize.buttonTitle,
        weight: .semibold
    )
    
    private lazy var logoSurf: UIImageView = {
        let element = UIImageView()
        element.image = .surfLogo
        element.contentMode = .scaleAspectFit
        return element
    }()
    
    private lazy var eyeButton: UIButton = {
        let element = UIButton(type: .system)
        element.setBackgroundImage(.eyeClosed, for: .normal)
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
    
    // MARK: - Actions
    @objc private func showPassword() {
        passwordTextField.becomeFirstResponder()
        passwordTextField.isSecureTextEntry.toggle()
        eyeButton.setBackgroundImage(
            passwordTextField.isSecureTextEntry ? .eyeClosed : .eyeOpen,
            for: .normal
        )
    }
    
    @objc private func login() {
        
        guard let loginText = loginTextField.text, !loginText.isEmpty else {
            loginUnderlineErrorLabel.isHidden = false
            underlineLogin.backgroundColor = .myRed
            loginTextField.becomeFirstResponder()
            
            passwordTextField.snp.updateConstraints {
                $0.top.equalTo(loginTextField.snp.bottom).offset(K.Constraints.topPasswordTextFieldNew)
            }
            
            return
        }
        
        loginUnderlineErrorLabel.isHidden = true
        underlineLogin.backgroundColor = .myGray
        
        guard let passwordText = passwordTextField.text, !passwordText.isEmpty else {
            passwordUnderlineErrorLabel.isHidden = false
            underlinePassword.backgroundColor = .myRed
            passwordTextField.becomeFirstResponder()
            
            passwordTextField.snp.updateConstraints {
                $0.top.equalTo(loginTextField.snp.bottom).offset(K.Constraints.topPasswordTextField)
            }
            authButton.snp.updateConstraints {
                $0.top.equalTo(passwordTextField.snp.bottom).offset(K.Constraints.topAuthButtonNew)
            }
            
            return
        }
        
        passwordTextField.snp.updateConstraints {
            $0.top.equalTo(loginTextField.snp.bottom).offset(K.Constraints.topPasswordTextField)
        }
        authButton.snp.updateConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(K.Constraints.topAuthButton)
        }
        
        passwordUnderlineErrorLabel.isHidden = true
        underlinePassword.backgroundColor = .myGray
        
        activityIndicator.startAnimating()
        authButton.setTitleColor(.clear, for: .normal)
        authButton.isEnabled = false
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
        authButton.addTarget(self, action: #selector(login), for: .touchUpInside)
        
        title = K.Text.titleLoginVC
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
