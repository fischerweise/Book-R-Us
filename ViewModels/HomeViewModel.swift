//
//  HomeViewModel.swift
//  [MVVM Project]Book-R-Us
//
//  Created by Mustafa Pekdemir on 4.04.2022.
//

import Foundation

final class HomeViewModel {
    
    var coordinator: MainCoordinator
    var users = [UserModel]()
    
    init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
    }
    
    func loadData(completion: @escaping (() -> Void)) {
        Service.shared.fillUsers() { users, error in
            if let users = users {
                self.users = users
            }
            completion()
        }
    }
    
}

 extension HomeViewModel: UserTableViewCellDelegate {
    func didTapPosts(with userId: Int, by name: String) {
        coordinator.goToPosts(with: userId, by: name)
    }
    
}
