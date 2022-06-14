//
//  PostModel.swift
//  [MVVM Project]Book-R-Us
//
//  Created by Mustafa Pekdemir on 5.04.2022.
//

import Foundation

struct PostModel: Codable {
    let id: Int
    let userId: Int
    let title: String
    let body: String
    
    enum CodingKeys: String, CodingKey {
        case id, userId, title, body
    }
}
