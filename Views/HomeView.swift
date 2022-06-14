//
//  HomeView.swift
//  [MVVM Project]Book-R-Us
//
//  Created by Mustafa Pekdemir on 5.04.2022.
//

import UIKit

final class HomeView: UIView {
    
    var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .singleLine
        tableView.rowHeight = UITableView.automaticDimension
        tableView.backgroundColor = .clear
        return tableView
    }()
    
    init(dataSource: UITableViewDataSource) {
        super.init(frame: .zero)
        setupTableView(dataSource: dataSource)
        setupViewConfiguration()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTableView(dataSource: UITableViewDataSource){
        tableView.dataSource = dataSource
        tableView.register(UserTableViewCell.self, forCellReuseIdentifier: "UserCell")
    }
    
}

extension HomeView: ViewConfiguration {
    func buildViewHierarchy() {
        addSubViews([tableView])
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    func configureViews() {
        backgroundColor = .white
    }
    
}


