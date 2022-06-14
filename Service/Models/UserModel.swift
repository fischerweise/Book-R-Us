//
//  UserModel.swift
//  [MVVM Project]Book-R-Us
//
//  Created by Mustafa Pekdemir on 5.04.2022.
//

import Foundation

struct UserModel: Codable {
    let id: Int
    let name: String
    let username: String
    let email: String
    let phone: String
    
    enum CodingKeys: String, CodingKey {
        case id, name, username, email, phone
    }
}
