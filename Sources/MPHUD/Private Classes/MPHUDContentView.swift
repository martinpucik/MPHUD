//
//  MPHUDContentView.swift
//  MPHUD
//
//  Created by Martin Púčik on 08/03/2020.
//

import UIKit

final class MPHUDContentView: UIView {

    // MARK: - Private properties

    private lazy var container: UIView = UIView()

    private lazy var effectView: UIVisualEffectView = {
        let effet = UIBlurEffect(style: .systemUltraThinMaterial)
        let view = UIVisualEffectView(effect: effet)
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return view
    }()

    // MARK: - Lifecycle

    init() {
        super.init(frame: .zero)
        setupAppearance()
        setupConstraints()
    }

    required init?(coder: NSCoder) { nil }

    // MARK: - Public methods

    func show(_ hud: MPHUD) {
        container.subviews.forEach { $0.removeFromSuperview() }
        let view = hudView(for: hud)
        container.addSubview(view)
        view.pinToEdges()
    }
}

// MARK: - Private methods

private extension MPHUDContentView {
    func setupAppearance() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .clear
        layer.cornerRadius = 8
        clipsToBounds = true

        addSubview(effectView)
        addSubview(container)
    }

    func setupConstraints() {
        container.pinToEdges()
    }

    func hudView(for hud: MPHUD) -> UIView {
        switch hud {
            case .loading(let message):
                return MPLoadingHUD(message: message)
        }
    }
}
