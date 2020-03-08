//
//  UIViewExtension.swift
//  MPHUD
//
//  Created by Martin Púčik on 08/03/2020.
//

import UIKit

extension UIView {
    func pinToEdges(_ superview: UIView? = nil, insets: UIEdgeInsets = .zero) {
        guard let superviewToPin = self.superview ?? superview else { return }
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: superviewToPin.leadingAnchor, constant: insets.left),
            trailingAnchor.constraint(equalTo: superviewToPin.trailingAnchor, constant: -insets.right),
            topAnchor.constraint(equalTo: superviewToPin.topAnchor, constant: insets.top),
            bottomAnchor.constraint(equalTo: superviewToPin.bottomAnchor, constant: -insets.bottom)
        ])
    }

    func pinToCenter(_ superview: UIView? = nil) {
        guard let superviewToPin = self.superview ?? superview else { return }
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            centerYAnchor.constraint(equalTo: superviewToPin.centerYAnchor),
            centerXAnchor.constraint(equalTo: superviewToPin.centerXAnchor),
        ])
    }
}
