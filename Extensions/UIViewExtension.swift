//
//  UIViewExtension.swift
//  [MVVM Project]Book-R-Us
//
//  Created by Mustafa Pekdemir on 5.04.2022.
//

import UIKit

extension UIView {
    
    func addSubViews(_ views: [UIView], translatesAutoresizingMaskIntoConstraints: Bool = false) {
        views.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = translatesAutoresizingMaskIntoConstraints
            addSubview($0)
        }
    }
    
}
