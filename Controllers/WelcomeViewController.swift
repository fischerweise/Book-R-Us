//
//  WelcomeViewController.swift
//  MVVM-Third Graded Assignment
//
//  Created by Mustafa Pekdemir on 6.04.2022.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    private let viewModel: WelcomeViewModel?
    
    init(viewModel: WelcomeViewModel?) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let titleLabel = UILabel()
    let bodyLabel = UILabel()
    let secondaryLabel = UILabel()
    fileprivate func setupLabels() {
        titleLabel.backgroundColor = .black
        titleLabel.textColor = .white
        titleLabel.text = "HELLO! 👋🏻"
        titleLabel.textAlignment = .left
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont(name: "Futura", size: 34)
        bodyLabel.text = "Welcome to Book-R-Us App! Happy to see You! ❤️ Thanks so much for downloading our brand new app and giving us a try.🥰 Make sure to leave us a good review in the AppStore."
        bodyLabel.numberOfLines = 0
        bodyLabel.textAlignment = .justified
        bodyLabel.textColor = .black
        bodyLabel.font = UIFont(name: "Futura", size: 20)
        secondaryLabel.backgroundColor = .red
        secondaryLabel.textColor = .white
        secondaryLabel.text = "Let's get started 🌻"
        secondaryLabel.textAlignment = .left
        secondaryLabel.numberOfLines = 0
        secondaryLabel.font = UIFont(name: "Futura", size: 26)
    }
    
    fileprivate func setupStackView() {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, bodyLabel, secondaryLabel])
        view.addSubview(stackView)
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        stackView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -100).isActive = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 252/255, green: 255/255, blue: 178/255, alpha: 1.0)
        setupLabels()
        setupStackView()
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTapAnimations)))
    }
    
    @objc fileprivate func handleTapAnimations() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut) {
            self.titleLabel.transform = CGAffineTransform(translationX: -30, y: 0)
        } completion: { (_) in
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut) {
                self.titleLabel.alpha = 0
                self.titleLabel.transform = self.titleLabel.transform.translatedBy(x: 0, y: -200)
            }
        }
        UIView.animate(withDuration: 0.5, delay: 0.5, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut) {
            self.bodyLabel.transform = CGAffineTransform(translationX: -30, y: 0)
        } completion: { (_) in
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut) {
                self.bodyLabel.alpha = 0
                self.bodyLabel.transform = self.titleLabel.transform.translatedBy(x: 0, y: -200)
            }
            
        }
        UIView.animate(withDuration: 1.7, delay: 1, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseInOut) {
            self.secondaryLabel.transform = CGAffineTransform(translationX: -30, y: 0)
        } completion: { (_) in
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut) {
                self.secondaryLabel.alpha = 0
                self.secondaryLabel.transform = self.titleLabel.transform.translatedBy(x: 0, y: -200)
            } completion: { (_) in
                let goToHomeVC = HomeViewController(viewModel: HomeViewModel(coordinator: .init(navigationController: self.navigationController!)))
                self.navigationController?.pushViewController(goToHomeVC, animated: true)
            }
        }
    }
}
