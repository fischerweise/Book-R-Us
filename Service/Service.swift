//
//  Service.swift
//  [MVVM Project]Book-R-Us
//
//  Created by Mustafa Pekdemir on 4.04.2022.
//

import Alamofire
import UIKit

struct Service {
    
    static let shared = Service()
    func fillUsers(completion: @escaping ([UserModel]?, Error?) -> ()) {
        AF.request("https://jsonplaceholder.typicode.com/users").validate().responseJSON { response in
            guard response.error == nil else {
                completion(nil, response.error)
                return
            }
            do {
                if let data = response.data {
                    let models = try JSONDecoder().decode([UserModel].self, from: data)
                    completion(models, nil)
                    return
                }
            } catch {
                print("Error during JSON serialization: \(error.localizedDescription)")
            }
        }
    }
    
    func fillPosts(userId: Int, completion: @escaping ([PostModel]?, Error?) -> ()) {
        AF.request("https://jsonplaceholder.typicode.com/posts?userId=\(userId)").validate().responseJSON { response in
            guard response.error == nil else {
                completion(nil, response.error)
                return
            }
            do {
                if let data = response.data {
                    let models = try JSONDecoder().decode([PostModel].self, from: data)
                    completion(models, nil)
                    return
                }
            } catch {
                print("Error during JSON serialization: \(error.localizedDescription)")
            }
        }
    }
    
    func fillComments(postId: Int, completion: @escaping ([CommentModel]?, Error?) -> ()) {
        AF.request("https://jsonplaceholder.typicode.com/comments?postId=\(postId)").validate().responseJSON { response in
            guard response.error == nil else {
                completion(nil, response.error)
                return
            }
            do {
                if let data = response.data {
                    let models = try JSONDecoder().decode([CommentModel].self, from: data)
                    completion(models, nil)
                    return
                }
            } catch {
                print("Error during JSON serialization: \(error.localizedDescription)")
            }
        }
    }
}

extension UIViewController {
    
    func showAlert() {
        let alert = UIAlertController(title: "Error", message: "Something went wrong. Try again!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { _ in
            alert.dismiss(animated: true)
        }))
        self.present(alert, animated: true)
        return
    }
}
