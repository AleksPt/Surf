//
//  FavoriteViewController.swift
//  Surf2022
//
//  Created by Алексей on 26.06.2024.
//

import UIKit
import SnapKit

final class FavoriteViewController: UIViewController {
    
    // MARK: - UI
    private lazy var tableView: UITableView = {
        let element = UITableView()
        element.register(CellFavorite.self, forCellReuseIdentifier: CellFavorite.description())
        element.dataSource = self
        element.delegate = self
        element.showsVerticalScrollIndicator = false
        element.separatorStyle = .none
        element.delaysContentTouches = false
        return element
    }()
    
    // MARK: - Private properties
    private var tableDataSource = CollectionData.getCollection()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
        addSubviews()
        setupNavigationBar()
        setupConstraints()
    }
    
    // MARK: - Actions
    @objc private func searchButtonPressed() {
        
    }
}

// MARK: - UITableViewDataSource
extension FavoriteViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableDataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CellFavorite.description(), for: indexPath) as? CellFavorite else {
            return UITableViewCell()
        }
        let dataSourceItem = tableDataSource[indexPath.row]
        cell.configureCell(dataSourceItem)
        cell.selectionStyle = .none
        cell.delegate = self
        return cell
    }
}

// MARK: - UITableViewDelegate
extension FavoriteViewController: UITableViewDelegate {
}

// MARK: - CellFavoriteDelegate
extension FavoriteViewController: CellFavoriteDelegate {
    func warningDeleteFavorite(_ cell: CellFavorite) {
        guard let indexPath = tableView.indexPath(for: cell) else { return }
        showAlert(forRowAt: indexPath.row)
    }
}

// MARK: - Setup View Controller
private extension FavoriteViewController {
    func setupViewController() {
        self.addTapGestureToHideKeyboard()
        view.backgroundColor = .systemBackground
    }
    
    func addSubviews() {
        view.addSubview(tableView)
    }
    
    func setupNavigationBar() {
        title = K.Text.TitleVC.favoriteVC
        navigationController?.navigationBar.tintColor = .black
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: K.Image.searchLine,
            style: .done,
            target: self,
            action: #selector(searchButtonPressed)
        )
    }
    
    func setupConstraints() {
        tableView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
}

// MARK: - Alert
private extension FavoriteViewController {
    func showAlert(forRowAt: Int) {
        let alert = UIAlertController(
            title: K.Text.Alert.title,
            message: K.Text.Alert.messageFavoriteDelete,
            preferredStyle: .alert
        )
        
        let okAction = UIAlertAction(
            title: K.Text.Alert.okButton,
            style: .default
        )
        
        let cancelAction = UIAlertAction(
            title: K.Text.Alert.cancelButton,
            style: .cancel
        )
        
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
