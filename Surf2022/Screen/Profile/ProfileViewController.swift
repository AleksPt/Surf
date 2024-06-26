//
//  ProfileViewController.swift
//  Surf2022
//
//  Created by Алексей on 26.06.2024.
//

import UIKit
import SnapKit

final class ProfileViewController: UIViewController {
    
    // MARK: - UI
    private lazy var avatarImageView: UIImageView = {
        let element = UIImageView()
        element.contentMode = .scaleAspectFill
        element.layer.cornerRadius = 12
        element.clipsToBounds = true
        return element
    }()
    
    private lazy var nameLabel: UILabel = {
        let element = UILabel()
        element.font = UIFont(name: K.Font.medium, size: K.FontSize.size18)
        return element
    }()
    
    private lazy var surnameLabel: UILabel = {
        let element = UILabel()
        element.font = UIFont(name: K.Font.medium, size: K.FontSize.size18)
        return element
    }()
    
    private lazy var statusLabel: UILabel = {
        let element = UILabel()
        element.numberOfLines = 0
        element.textColor = K.Colors.b3b3b3
        element.font = UIFont(name: K.Font.light, size: K.FontSize.size12)
        return element
    }()
    
    private lazy var horizontalStack: UIStackView = {
        let element = UIStackView()
        element.axis = .horizontal
        element.spacing = 16
        element.distribution = .fillProportionally
        element.alignment = .leading
        element.addArrangedSubview(avatarImageView)
        element.addArrangedSubview(verticalStack)
        return element
    }()
    
    private lazy var nameStack: UIStackView = {
        let element = UIStackView()
        element.axis = .vertical
        element.distribution = .fillEqually
        element.addArrangedSubview(nameLabel)
        element.addArrangedSubview(surnameLabel)
        return element
    }()
    
    private lazy var verticalStack: UIStackView = {
        let element = UIStackView()
        element.axis = .vertical
        element.spacing = 8
        element.distribution = .fill
        element.alignment = .leading
        element.addArrangedSubview(nameStack)
        element.addArrangedSubview(statusLabel)
        return element
    }()
    
    private let logoutButton = UIButton(
        text: K.Text.Button.logout,
        size: K.FontSize.size16,
        weight: .semibold
    )
    
    private lazy var tableView: UITableView = {
        let element = UITableView()
        element.register(CellProfile.self, forCellReuseIdentifier: CellProfile.description())
        element.dataSource = self
        element.delegate = self
        element.isScrollEnabled = false
        element.separatorInset = .zero
        return element
    }()
    
    // MARK: - Private properties
    private var profileData = ProfileData.getProfile()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
        addSubviews()
        setupNavigationBar()
        setupConstraints()
    }
    
    // MARK: - Actions
    @objc private func didTapLogout() {
        showAlert()
    }
}

// MARK: - UITableViewDataSource
extension ProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CellProfile.description()) as? CellProfile else {
            return UITableViewCell()
        }
        cell.configureCell(indexPath, profileData)
        cell.selectionStyle = .none
        return cell
    }
}

// MARK: - UITableViewDelegate
extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        72
    }
}

// MARK: - Setup View Controller
private extension ProfileViewController {
    func setupViewController() {
        self.addTapGestureToHideKeyboard()
        view.backgroundColor = .systemBackground
        
        avatarImageView.image = UIImage(named: profileData.avatar)
        nameLabel.text = profileData.name
        surnameLabel.text = profileData.surname
        statusLabel.text = "«" + profileData.status + "»"
        
        logoutButton.addTarget(
            self,
            action: #selector(didTapLogout),
            for: .touchUpInside
        )
    }
    
    func addSubviews() {
        view.addSubview(logoutButton)
        view.addSubview(horizontalStack)
        view.addSubview(tableView)
    }
    
    func setupNavigationBar() {
        title = K.Text.TitleVC.profileVC
        navigationController?.navigationBar.tintColor = .black
    }
    
    func setupConstraints() {
        horizontalStack.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(24)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
        
        avatarImageView.snp.makeConstraints {
            $0.width.height.equalTo(128)
        }
        
        logoutButton.snp.makeConstraints {
            $0.height.equalTo(K.Constraints.heightButton)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-24)
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(horizontalStack.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(logoutButton.snp.top)
        }
    }
}

// MARK: - Alert
private extension ProfileViewController {
    func showAlert() {
        let alert = UIAlertController(
            title: K.Text.Alert.title,
            message: K.Text.Alert.messageLogout,
            preferredStyle: .alert
        )
        
        let okAction = UIAlertAction(
            title: K.Text.Alert.okButton,
            style: .default) { _ in
                NotificationCenter.default.post(
                    name: Notification.Name(K.NotificationKey.login),
                    object: nil,
                    userInfo: [K.NotificationKey.login: false]
                )
            }
        
        let cancelAction = UIAlertAction(
            title: K.Text.Alert.cancelButton,
            style: .cancel
        )
        
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
