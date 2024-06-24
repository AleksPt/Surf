//
//  Cell.swift
//  Surf2022
//
//  Created by Алексей on 24.06.2024.
//

import UIKit
import SnapKit

final class Cell: UICollectionViewCell {
    
    // MARK: - UI
    private lazy var imageView: UIImageView = {
        let element = UIImageView()
        element.layer.cornerRadius = 12
        element.clipsToBounds = true
        element.contentMode = .scaleAspectFill
        element.isUserInteractionEnabled = true
        return element
    }()
    
    private lazy var likeButton: UIButton = {
        let element = UIButton(type: .system)
        element.tintColor = .white
        return element
    }()
    
    private lazy var titleLabel: UILabel = {
        let element = UILabel()
        element.font = .systemFont(ofSize: K.FontSize.titleLabelCell, weight: .medium)
        return element
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
    
    // MARK: - Public methods
    func configureCell(_ model: CollectionData) {
        imageView.image = UIImage(named: model.image)
        titleLabel.text = model.title
        likeButton.setBackgroundImage(model.isLiked ? UIImage(named: "heart-fill") : UIImage(named: "heart-line"), for: .normal)
    }
}

// MARK: - Set Views
private extension Cell {
    func setViews() {
        contentView.addSubview(imageView)
        imageView.addSubview(likeButton)
        contentView.addSubview(titleLabel)
    }
}

// MARK: - Setup Constraints
private extension Cell {
    func setupConstraints() {
        
        imageView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.width.equalTo(UIScreen.main.bounds.width / 2 - 20).priority(999)
            $0.height.equalTo(222).priority(999)
        }
        
        titleLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(imageView.snp.bottom).offset(8)
            $0.bottom.equalToSuperview()
        }
        
        likeButton.snp.makeConstraints {
            $0.width.height.equalTo(24)
            $0.top.trailing.equalToSuperview().inset(8)
        }
    }
}
