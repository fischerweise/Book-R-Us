//
//  WelcomeViewModel.swift
//  [MVVM Project]Book-R-Us
//
//  Created by Mustafa Pekdemir on 10.04.2022.
//

import Foundation

final class WelcomeViewModel {
    
    var coordinator: MainCoordinator
    
    init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
    }
}
extension WelcomeViewModel: UserTableViewCellDelegate {
   func didTapPosts(with userId: Int, by name: String) {
       coordinator.start()
   }
   
}
