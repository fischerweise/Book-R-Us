//
//  HomeViewController.swift
//  [MVVM Project]Book-R-Us
//
//  Created by Mustafa Pekdemir on 4.04.2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    private lazy var customView = HomeView(dataSource: self)
    private let viewModel: HomeViewModel
    
    init(viewModel: HomeViewModel){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        self.view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Main"
        fetchData()
    }
    
    func fetchData() {
        viewModel.loadData{ () in
            if self.viewModel.users.isEmpty {
                self.showAlert()
            } else {
                self.customView.tableView.reloadData()
            }
        }
    }
    
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as? UserTableViewCell else {
            return UITableViewCell()
        }
        let backgroundView = UIView()
        backgroundView.backgroundColor = .white
        cell.selectedBackgroundView = backgroundView
        let user = viewModel.users[indexPath.row]
        cell.selectionStyle = .blue
        cell.id = user.id
        cell.initialsLabel.text = String(user.name.prefix(2))
        cell.initialsLabel.textColor = .black
        cell.initialsLabel.textAlignment = .center
        cell.initialsLabel.font = UIFont(name: "Futura", size: 34)
        cell.nameLabel.text = user.name
        cell.nameLabel.font = UIFont(name: "Futura", size: 18)
        cell.nameLabel.textColor = .black
        cell.nameLabel.tintColor = .black
        cell.userNameLabel.text = user.username
        cell.userNameLabel.font = UIFont(name: "Futura", size: 22)
        cell.userNameLabel.textColor = .black
        cell.userNameLabel.tintColor = .black
        cell.emailLabel.text = user.email
        cell.emailLabel.font = UIFont(name: "Futura", size: 18)
        cell.emailLabel.textColor = .systemBlue
        cell.emailLabel.tintColor = .systemBlue
        cell.phoneLabel.text = user.phone
        cell.phoneLabel.font = UIFont(name: "Futura", size: 16)
        cell.phoneLabel.textColor = .darkGray
        cell.phoneLabel.tintColor = .darkGray
        cell.delegate = viewModel
        cell.contentView.backgroundColor = indexPath.row % 2 == 0 ? .clear : UIColor(white: 0.667, alpha: 0.2)
        cell.backgroundColor = .clear
        return cell
    }
}
