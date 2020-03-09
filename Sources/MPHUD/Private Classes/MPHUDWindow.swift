//
//  MPHUDWindow.swift
//  MPHUD
//
//  Created by Martin Púčik on 08/03/2020.
//

import UIKit

final class MPHUDWindow {

    // MARK: - Private properties

    private static let shared: MPHUDWindow = MPHUDWindow()
    private lazy var contentContainer: MPHUDContentView = MPHUDContentView()

    private lazy var window: UIWindow = {
        let window = UIWindow()
        window.alpha = 0
        window.isHidden = false
        window.backgroundColor = UIColor.tertiarySystemBackground.withAlphaComponent(0.5)
        return window
    }()

    // MARK: - Lifecycle

    init() {
        setupAppearance()
        setupConstraints()
    }

    // MARK: - Public methods

    static func show(_ hud: MPHUD) {
        shared.contentContainer.show(hud)
        UIApplication.shared.windows.first?.bringSubviewToFront(shared.window)
        UIView.animate(withDuration: 0.2) {
            shared.window.alpha = 1
        }
    }

    static func hide() {
        UIView.animate(withDuration: 0.2) {
            shared.window.alpha = 0
        }
    }
}

// MARK: - Private methods

private extension MPHUDWindow {
    func setupAppearance() {
        guard let keyWindow = UIApplication.shared.windows.first else { return }
        keyWindow.addSubview(window)
        window.addSubview(contentContainer)
    }

    func setupConstraints() {
        guard let _ = UIApplication.shared.windows.first else { return }
        window.pinToEdges()
        contentContainer.pinToCenter()
    }
}
