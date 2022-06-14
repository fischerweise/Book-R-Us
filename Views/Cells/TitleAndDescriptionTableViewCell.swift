//
//  TitleAndDescriptionTableViewCell.swift
//  [MVVM Project]Book-R-Us
//
//  Created by Mustafa Pekdemir on 6.04.2022.
//

import UIKit

class TitleAndDescriptionTableViewCell: UITableViewCell {
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .red
        label.tintColor = .black
        label.contentMode = .left
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Futura", size: 18)
        return label
    }()
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.contentMode = .left
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 17)
        return label
    }()
    lazy var showMoreButton: UIButton = {
        let button = UIButton()
        button.configuration = .filled()
        button.contentMode = .scaleToFill
        button.setTitle("Show More", for: .normal)
        button.titleLabel?.font = UIFont(name: "Futura-Bold", size: 14)
        button.layer.cornerRadius = 12
        button.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        button.layer.shadowOffset = CGSize(width: 1, height: 1)
        button.layer.shadowRadius = 2.1
        button.layer.shadowOpacity = 0.6
        button.setTitleColor(UIColor(red: 252/255, green: 255/255, blue: 178/255, alpha: 1.0), for: .normal)
        button.contentHorizontalAlignment = .center
        button.contentVerticalAlignment = .center
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        buildViewHierarchy()
        setupConstraints()
        configureViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TitleAndDescriptionTableViewCell: ViewConfiguration {
    func buildViewHierarchy() {
        self.contentView.addSubViews([titleLabel, descriptionLabel, showMoreButton])
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            
            showMoreButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -5),
            showMoreButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 18)
        ])
    }
    
    func configureViews() {
        backgroundColor = .clear
    }
    
}
