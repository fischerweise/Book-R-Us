//
//  CommentModel.swift
//  [MVVM Project]Book-R-Us
//
//  Created by Mustafa Pekdemir on 5.04.2022.
//

import Foundation

struct CommentModel: Codable {
    let id: Int
    let postId: Int
    let name: String
    let body: String
    
    enum CodingKeys: String, CodingKey {
        case id, postId, name, body
    }
}
