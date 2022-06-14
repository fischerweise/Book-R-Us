//
//  CommentViewModel.swift
//  [MVVM Project]Book-R-Us
//
//  Created by Mustafa Pekdemir on 4.04.2022.
//

import Foundation

final class CommentViewModel {
    
    var postId = Int()
    var userName = String()
    var comments = [CommentModel]()
    
    func loadData(completion: @escaping (() -> Void)) {
        Service.shared.fillComments(postId: postId) { comments, error in
            if let comments = comments {
                self.comments = comments
            }
            completion()
        }
    }
    
}
