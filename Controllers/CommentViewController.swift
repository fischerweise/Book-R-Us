//
//  CommentViewController.swift
//  [MVVM Project]Book-R-Us
//
//  Created by Mustafa Pekdemir on 4.04.2022.
//

import UIKit

class CommentViewController: UIViewController {
    private lazy var customView = TitleAndDescriptionView(dataSource: self, delegate: self)
    private let viewModel: CommentViewModel
    let service = Service()
    
    init(viewModel: CommentViewModel){
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
        navigationItem.title = "Comments of: \(viewModel.userName)"
        fetchData()
    }
    
    func fetchData() {
        viewModel.loadData{ () in
            if self.viewModel.comments.isEmpty {
                self.showAlert()
            } else {
                self.customView.tableView.reloadData()
            }
        }
    }
    
}


extension CommentViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {}
}

extension CommentViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TitleAndDescriptionCell", for: indexPath) as? TitleAndDescriptionTableViewCell else {
            return UITableViewCell()
        }
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor(red: 252/255, green: 255/255, blue: 178/255, alpha: 1.0)
        cell.selectedBackgroundView = backgroundView
        let comment = viewModel.comments[indexPath.row]
        cell.selectionStyle = .none
        cell.titleLabel.text = comment.name
        cell.titleLabel.textColor = .black
        cell.titleLabel.font = UIFont(name: "Futura", size: 20)
        cell.descriptionLabel.text = comment.body
        cell.descriptionLabel.textColor = .darkGray
        cell.backgroundColor = UIColor(red: 252/255, green: 255/255, blue: 178/255, alpha: 1.0)
        cell.showMoreButton.isHidden = true
        return cell
    }
    
}
