//
//  ViewConfiguration.swift
//  [MVVM Project]Book-R-Us
//
//  Created by Mustafa Pekdemir on 5.04.2022.
//

import UIKit

protocol ViewConfiguration: AnyObject {
    func setupConstraints()
    func buildViewHierarchy()
    func configureViews()
    func setupViewConfiguration()
}

extension ViewConfiguration {
    func setupViewConfiguration() {
        buildViewHierarchy()
        setupConstraints()
        configureViews()
    }
}
