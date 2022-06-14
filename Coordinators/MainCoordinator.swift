//
//  MainCoordinator.swift
//  [MVVM Project]Book-R-Us
//
//  Created by Mustafa Pekdemir on 4.04.2022.
//
import UIKit

class MainCoordinator: Coordinator {

var childCoordinators = [Coordinator]()
var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
   func start() {
    
       let viewModel = WelcomeViewModel(coordinator: self)
       let controller = WelcomeViewController(viewModel: viewModel)
       navigationController.pushViewController(controller, animated: true)
    }
    
    func goToHome(with userId: Int, by name: String) {
        let viewModel = HomeViewModel(coordinator: self)
        let controller = HomeViewController(viewModel: viewModel)
        navigationController.pushViewController(controller, animated: true)
    }
    
    func goToPosts(with userId: Int, by name: String) {
        let viewModel = PostViewModel(coordinator: self)
        viewModel.userId = userId
        viewModel.userName = name
        let controller = PostViewController(viewModel: viewModel)
        navigationController.pushViewController(controller, animated: true)
    }
    
    func goToComments(with postId: Int, by userName: String) {
        let viewModel = CommentViewModel()
        viewModel.postId = postId
        viewModel.userName = userName
        let controller = CommentViewController(viewModel: viewModel)
        navigationController.pushViewController(controller, animated: true)
    }
    func goToDetail(with name: String, by image: UIImage) {
        let viewModel = DetailsViewModel()
        viewModel.name = name
        let controller = DetailsViewController(viewModel: viewModel)
        navigationController.pushViewController(controller, animated: true)
    }
    
}
