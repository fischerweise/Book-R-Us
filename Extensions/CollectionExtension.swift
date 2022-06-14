//
//  CollectionExtension.swift
//  [MVVM Project]Book-R-Us
//
//  Created by Mustafa Pekdemir on 5.04.2022.
//

import UIKit

extension Collection where Self.Element == NSLayoutConstraint {
    func activate() {
        forEach { $0.isActive = true}
    }
}

