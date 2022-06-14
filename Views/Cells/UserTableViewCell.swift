//
//  UserTableViewCell.swift
//  [MVVM Project]Book-R-Us
//
//  Created by Mustafa Pekdemir on 6.04.2022.
//

import UIKit

protocol UserTableViewCellDelegate: AnyObject {
    func didTapPosts(with userId: Int, by name: String)
}

class UserTableViewCell: UITableViewCell {
    
    lazy var initialsLabel: UILabel = {
        let label = UILabel()
        label.contentMode = .scaleToFill
        label.backgroundColor = UIColor(red: 252/255, green: 255/255, blue: 178/255, alpha: 1.0)
        label.contentMode = .center
        label.text = "initials"
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var initialsView: UIView = {
        let view = UIView()
        view.contentMode = .scaleToFill
        view.backgroundColor = UIColor(red: 252/255, green: 255/255, blue: 178/255, alpha: 1.0)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.contentMode = .center
        label.text = "name"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var userNameLabel: UILabel = {
        let label = UILabel()
        label.contentMode = .left
        label.text = "username"
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.contentMode = .left
        label.text = "email"
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var phoneLabel: UILabel = {
        let label = UILabel()
        label.contentMode = .left
        label.text = "phone"
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var postsButton: UIButton = {
        let button = UIButton()
        button.configuration = .filled()
        button.contentMode = .scaleToFill
        button.setTitle("Posts", for: .normal)
        button.titleLabel?.font = UIFont(name: "Futura-Bold", size: 20)
        button.backgroundColor = .black
        button.layer.cornerRadius = 12
        button.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        button.layer.shadowOffset = CGSize(width: 1, height: 1)
        button.layer.shadowRadius = 2.1
        button.layer.shadowOpacity = 0.6
        button.contentHorizontalAlignment = .center
        button.contentVerticalAlignment = .center
        button.setTitleColor(UIColor(red: 252/255, green: 255/255, blue: 178/255, alpha: 1.0), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(postsAction), for: .touchUpInside)
        return button
    }()
    
    
    lazy var buttonStack: UIStackView = {
        let stackView = UIStackView()
        stackView.contentMode = .scaleToFill
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var separator: UIView = {
        let seperator = UIView()
        seperator.contentMode = .scaleToFill
        seperator.backgroundColor = .white
        seperator.translatesAutoresizingMaskIntoConstraints = false
        return seperator
    }()
    
    
    var id: Int = 0
    var delegate: UserTableViewCellDelegate?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        buildViewHierarchy()
        setupConstraints()
        configureViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    @objc func postsAction(sender: UIButton) {
        delegate?.didTapPosts(with: id, by: nameLabel.text ?? "")
    }
}

extension UserTableViewCell: ViewConfiguration {
    func buildViewHierarchy() {
        self.contentView.addSubViews([userNameLabel, emailLabel, phoneLabel, nameLabel, initialsView, separator, buttonStack])
        initialsView.addSubview(initialsLabel)
        buttonStack.addArrangedSubview(postsButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            initialsView.widthAnchor.constraint(equalToConstant: 88),
            initialsView.heightAnchor.constraint(equalToConstant: 88),
            initialsView.trailingAnchor.constraint(equalTo: initialsLabel.trailingAnchor),
            
            initialsLabel.topAnchor.constraint(equalTo: initialsView.topAnchor),
            
            initialsView.bottomAnchor.constraint(equalTo: initialsLabel.bottomAnchor),
            
            initialsLabel.leadingAnchor.constraint(equalTo: initialsView.leadingAnchor, constant: 32),
            
            initialsView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            initialsView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            nameLabel.topAnchor.constraint(equalTo: initialsView.bottomAnchor, constant: 16),
            
            separator.widthAnchor.constraint(equalToConstant: 2),
            separator.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            separator.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 32),
            separator.leadingAnchor.constraint(equalTo: initialsView.trailingAnchor, constant: 32),
            
            userNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            userNameLabel.leadingAnchor.constraint(equalTo: separator.trailingAnchor, constant: 16),
            userNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            
            emailLabel.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: 24),
            emailLabel.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            emailLabel.leadingAnchor.constraint(equalTo: separator.trailingAnchor, constant: 16),
            
            phoneLabel.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 24),
            phoneLabel.leadingAnchor.constraint(equalTo: separator.trailingAnchor, constant: 16),
            phoneLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            buttonStack.topAnchor.constraint(equalTo: phoneLabel.bottomAnchor, constant: 64),
            buttonStack.topAnchor.constraint(equalTo: separator.bottomAnchor, constant: 24),
            buttonStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            buttonStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            buttonStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
    }
    
    func configureViews() {
        backgroundColor = .white
    }
    
}
