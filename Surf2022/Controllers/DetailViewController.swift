//
//  DetailViewController.swift
//  Surf2022
//
//  Created by Алексей on 24.06.2024.
//

import UIKit
import SnapKit

final class DetailViewController: UIViewController {
    
    // MARK: - UI
    private lazy var imageView: UIImageView = {
        let element = UIImageView()
        element.contentMode = .scaleAspectFill
        element.clipsToBounds = true
        element.layer.cornerRadius = 12
        return element
    }()
    
    private lazy var titleLabel: UILabel = {
        let element = UILabel()
        element.font = .systemFont(ofSize: K.FontSize.titleLabelDetailVC, weight: .medium)
        element.numberOfLines = 0
        return element
    }()
    
    private lazy var descriptionTextView: UITextView = {
        let element = UITextView()
        element.textContainerInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 5)
        element.font = .systemFont(ofSize: K.FontSize.descriptionLabelDetailVC, weight: .regular)
        let attributedString = NSMutableAttributedString(string: descriptionText)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 20
        attributedString.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: attributedString.length))
        element.attributedText = attributedString
        
        return element
    }()
    
    private lazy var dateLabel: UILabel = {
        let element = UILabel()
        element.textColor = K.Colors.dateLabel
        element.font = .systemFont(ofSize: K.FontSize.dateLabelDetailVC, weight: .medium)
        return element
    }()
    
    // MARK: - Private properties
    private var descriptionText = ""
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        descriptionTextView.setContentOffset(.zero, animated: false)

       }
    
    // MARK: - Public methods
    func configureVC(_ model: CollectionData) {
        title = model.title
        imageView.image = UIImage(named: model.image)
        titleLabel.text = model.title
        dateLabel.text = model.date.dateFormatter()
        descriptionText = model.description
    }
    
    // MARK: - Actions
    @objc private func didTapBackButton() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func searchButtonPressed() {
        
    }
}

// MARK: - Setup Views
private extension DetailViewController {
    func setupViews() {
        self.addTapGestureToHideKeyboard()
        view.backgroundColor = .systemBackground
        
        view.addSubview(imageView)
        view.addSubview(titleLabel)
        view.addSubview(dateLabel)
        view.addSubview(descriptionTextView)

        setupNavigationBar()
    }
    
    func setupNavigationBar() {
        navigationController?.navigationBar.tintColor = .black
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "magnifyingglass"),
            style: .done,
            target: self,
            action: #selector(searchButtonPressed)
        )
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(named: "back"),
            style: .done,
            target: self,
            action: #selector(didTapBackButton)
        )
    }
}

// MARK: - Setup Constraints
private extension DetailViewController {
    func setupConstraints() {
        imageView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(24)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.bottom.equalTo(view.snp.centerY).offset(35)
        }
        
        titleLabel.snp.makeConstraints {
            $0.leading.equalTo(imageView.snp.leading)
            $0.top.equalTo(imageView.snp.bottom).offset(16)
            $0.trailing.equalTo(dateLabel.snp.leading).inset(16)
        }
        
        dateLabel.snp.makeConstraints {
            $0.trailing.equalTo(imageView.snp.trailing).inset(11)
            $0.centerY.equalTo(titleLabel.snp.centerY)
        }
        
        descriptionTextView.snp.makeConstraints {
            $0.leading.equalTo(imageView.snp.leading).offset(-4)
            $0.trailing.equalTo(imageView.snp.trailing)
            $0.top.equalTo(titleLabel.snp.bottom).offset(8)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
}
