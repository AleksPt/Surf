//
//  CellFavorite.swift
//  Surf2022
//
//  Created by Алексей on 26.06.2024.
//

import UIKit
import SnapKit

protocol CellFavoriteDelegate: AnyObject {
    func warningDeleteFavorite(_ cell: CellFavorite)
}

final class CellFavorite: UITableViewCell {
    
    // MARK: - UI
    private lazy var picture: UIImageView = {
        let element = UIImageView()
        element.contentMode = .scaleAspectFill
        element.layer.cornerRadius = 12
        element.clipsToBounds = true
        element.isUserInteractionEnabled = true
        return element
    }()
    
    private lazy var likeButton: UIButton = {
        let element = UIButton(type: .system)
        element.setBackgroundImage(UIImage(named: "heart-fill"), for: .normal)
        element.addTarget(self, action: #selector(dislike), for: .touchUpInside)
        return element
    }()
    
    private lazy var titleLabel: UILabel = {
        let element = UILabel()
        element.font = UIFont(name: K.Font.medium, size: K.FontSize.titleLabelDetailVC)
        return element
    }()
    
    private lazy var dateLabel: UILabel = {
        let element = UILabel()
        element.font = UIFont(name: K.Font.medium, size: K.FontSize.dateLabelDetailVC)
        element.textAlignment = .right
        element.textColor = .dateLabel
        return element
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let element = UILabel()
        element.font = UIFont(name: K.Font.regular, size: K.FontSize.titleLabelCell)
        return element
    }()
    
    // MARK: - Public properties
    weak var delegate: CellFavoriteDelegate?
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        picture.image = nil
        titleLabel.text = nil
        dateLabel.text = nil
        descriptionLabel.text = nil
    }
    
    // MARK: - Public methods
    func configureCell(_ model: CollectionData) {
        picture.image = UIImage(named: model.image)
        titleLabel.text = model.title
        dateLabel.text = model.date.dateFormatter()
        descriptionLabel.text = model.description
    }
    
    // MARK: - Actions
    @objc private func dislike() {
        delegate?.warningDeleteFavorite(self)
    }
}

// MARK: - Setup Cell
private extension CellFavorite {
    func addSubviews() {
        contentView.addSubview(picture)
        picture.addSubview(likeButton)
        contentView.addSubview(titleLabel)
        contentView.addSubview(dateLabel)
        contentView.addSubview(descriptionLabel)
    }
    
    func setupConstraints() {
        picture.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(UIScreen.main.bounds.width - 32 - 17)
        }
        
        likeButton.snp.makeConstraints {
            $0.width.height.equalTo(24)
            $0.top.equalTo(8)
            $0.trailing.equalTo(-8)
        }
        
        titleLabel.snp.makeConstraints {
            $0.leading.equalTo(picture.snp.leading)
            $0.top.equalTo(picture.snp.bottom).offset(16)
            $0.trailing.equalTo(dateLabel.snp.leading).offset(-11)
        }
        
        dateLabel.snp.makeConstraints {
            $0.centerY.equalTo(titleLabel.snp.centerY)
            $0.trailing.equalTo(picture.snp.trailing).offset(-11)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.leading.equalTo(titleLabel.snp.leading)
            $0.top.equalTo(titleLabel.snp.bottom).offset(8)
            $0.trailing.equalTo(dateLabel.snp.trailing)
            $0.bottom.equalToSuperview().offset(-24)
        }
    }
}
