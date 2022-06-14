//
//  TitleAndDescriptionView.swift
//  [MVVM Project]Book-R-Us
//
//  Created by Mustafa Pekdemir on 5.04.2022.
//

import UIKit

final class TitleAndDescriptionView: UIView {
    
    var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .singleLine
        tableView.rowHeight = UITableView.automaticDimension
        tableView.backgroundColor = UIColor(red: 252/255, green: 255/255, blue: 178/255, alpha: 1.0)
        return tableView
    }()
    
    init(dataSource: UITableViewDataSource, delegate: UITableViewDelegate) {
        super.init(frame: .zero)
        setupTableView(dataSource: dataSource, delegate: delegate)
        setupViewConfiguration()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTableView(dataSource: UITableViewDataSource, delegate: UITableViewDelegate){
        tableView.dataSource = dataSource
        tableView.delegate = delegate
        tableView.register(TitleAndDescriptionTableViewCell.self, forCellReuseIdentifier: "TitleAndDescriptionCell")
    }
    
}

extension TitleAndDescriptionView: ViewConfiguration {
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
        backgroundColor = .clear
    }
    
}


