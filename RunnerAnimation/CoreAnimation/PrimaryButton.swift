//
//  PrimaryButton.swift
//  RunnerAnimation
//
//  Created by Sentinel on 3/2/24.
//

import UIKit

class PrimaryButton: UIButton {
    private enum Constants {
        static let width = 361.0
        static let fontSize = 18.0
        static let cornerRadius = 5.0
    }
    
    func configure(with text: String) {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: Constants.width).isActive = true
        setAttributedTitle(NSAttributedString(string: text, attributes: [.foregroundColor: UIColor.white,
                                                                         .font: UIFont(name: "Bradley Hand Bold", size: Constants.fontSize) ?? UIFont.systemFont(ofSize: Constants.fontSize)]), for: .normal)
        setTitle(text, for: .normal)
        backgroundColor = .systemPurple
        layer.cornerRadius = Constants.cornerRadius
    }
}
