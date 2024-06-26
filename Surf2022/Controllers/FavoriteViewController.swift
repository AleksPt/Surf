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
        return cell
    }
}

// MARK: - UITableViewDelegate
extension FavoriteViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
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
        title = "Избранное"
        navigationController?.navigationBar.tintColor = .black
    }
    
    func setupConstraints() {
        tableView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
}
