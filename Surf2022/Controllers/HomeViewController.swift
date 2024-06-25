//
//  HomeViewController.swift
//  Surf2022
//
//  Created by Алексей on 24.06.2024.
//

import UIKit
import SnapKit

final class HomeViewController: UIViewController {
    
    // MARK: - UI
    private lazy var refresh: UIRefreshControl = {
        let element = UIRefreshControl()
        return element
    }()
    
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let element = UIActivityIndicatorView()
        element.style = .large
        element.hidesWhenStopped = true
        return element
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 16
        layout.minimumInteritemSpacing = 7
        let element = UICollectionView(frame: .zero, collectionViewLayout: layout)
        element.register(Cell.self, forCellWithReuseIdentifier: Cell.description())
        element.delaysContentTouches = false
        element.refreshControl = refresh
        element.showsVerticalScrollIndicator = false
        return element
    }()
    
    private lazy var errorLoadFeedMainStack: UIStackView = {
        let element = UIStackView()
        element.axis = .vertical
        element.spacing = 24
        element.distribution = .fillProportionally
        return element
    }()
    
    private lazy var errorLoadFeedSecondStack: UIStackView = {
        let element = UIStackView()
        element.axis = .vertical
        element.distribution = .fillProportionally
        element.spacing = 12
        return element
    }()
    
    private lazy var errorLoadFeedSmile: UIImageView = {
        let element = UIImageView()
        element.image = .smileUnhappy
        element.contentMode = .scaleAspectFit
        return element
    }()
    
    private lazy var errorLoadFeedLabel: UILabel = {
        let element = UILabel()
        element.text = "Не удалось загрузить ленту\nОбновите экран или попробуйте позже"
        element.numberOfLines = 0
        element.textColor = K.Colors.errorLoadFeedLabel
        element.font = .systemFont(ofSize: K.FontSize.errorLoadFeedLabel, weight: .regular)
        element.textAlignment = .center
        return element
    }()
    
    private let updateButton = UIButton(
        text: "Обновить",
        size: K.FontSize.buttonTitle,
        weight: .semibold
    )
    
    // MARK: - Private properties
    private let collectionDataSource = CollectionData.getCollection()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        setDelegates()
    }
    
    // MARK: - Private methods
    private func setDelegates() {
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}

// MARK: - UICollectionDataSource
extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        collectionDataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell.description(), for: indexPath) as? Cell else { return UICollectionViewCell() }
        
        let dataItem = collectionDataSource[indexPath.item]
        cell.configureCell(dataItem)
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let dataItem = collectionDataSource[indexPath.item]
        let detailVC = DetailViewController()
        detailVC.configureVC(dataItem)
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

// MARK: - Setup Views
private extension HomeViewController {
    func setupViews() {
        self.addTapGestureToHideKeyboard()
        view.backgroundColor = .systemBackground
        
        view.addSubview(collectionView)
        view.addSubview(errorLoadFeedMainStack)
        errorLoadFeedMainStack.addArrangedSubview(errorLoadFeedSecondStack)
        errorLoadFeedMainStack.addArrangedSubview(updateButton)
        errorLoadFeedSecondStack.addArrangedSubview(errorLoadFeedSmile)
        errorLoadFeedSecondStack.addArrangedSubview(errorLoadFeedLabel)
        view.addSubview(activityIndicator)
        
        setupNavigationBar()
        
        errorLoadFeedMainStack.isHidden = true
    }
    
    func setupNavigationBar() {
        title = K.Text.titleHomeVC
        navigationItem.hidesBackButton = true
        navigationController?.navigationBar.tintColor = .black
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "magnifyingglass"),
            style: .done,
            target: self,
            action: nil
        )
    }
}

// MARK: - Setup Constraints
private extension HomeViewController {
    func setupConstraints() {
        collectionView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        
        errorLoadFeedMainStack.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(16)
        }
        
        updateButton.snp.makeConstraints {
            $0.height.equalTo(K.Constraints.heightButton)
        }
        
        activityIndicator.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
