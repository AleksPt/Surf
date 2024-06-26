//
//  CellProfile.swift
//  Surf2022
//
//  Created by Алексей on 26.06.2024.
//

import UIKit
import SnapKit

final class CellProfile: UITableViewCell {
    
    // MARK: - UI
    private lazy var titleLabel: UILabel = {
        let element = UILabel()
        element.font = .systemFont(ofSize: 12)
        element.textColor = .dateLabel
        return element
    }()
    
    private lazy var valueLabel: UILabel = {
        let element = UILabel()
        element.font = .systemFont(ofSize: 18)
        return element
    }()
    
    private lazy var stack: UIStackView = {
        let element = UIStackView()
        element.axis = .vertical
        element.spacing = 2
        element.distribution = .equalCentering
        element.addArrangedSubview(titleLabel)
        element.addArrangedSubview(valueLabel)
        return element
    }()
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    // MARK: - Public properties
    func configureCell(_ index: IndexPath, _ item: ProfileData) {
        switch index.row {
        case 0:
            titleLabel.text = "Город"
            valueLabel.text = item.city
        case 1:
            titleLabel.text = "Телефон"
            valueLabel.text = item.phone
        case 2:
            titleLabel.text = "Почта"
            valueLabel.text = item.email
        default:
            break
        }
    }
}

// MARK: - Setup Cell
private extension CellProfile {
    func addSubviews() {
        contentView.addSubview(stack)
    }
    
    func setupConstraints() {
        stack.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.centerY.equalToSuperview()
        }
    }
}
