//
//  MPLoadingHUD.swift
//  MPHUD
//
//  Created by Martin Púčik on 08/03/2020.
//

import UIKit

final class MPLoadingHUD: UIView {

    // MARK: - Private properties

    private let message: String?

    // MARK: - Lifecycle

    init(message: String?) {
        self.message = message
        super.init(frame: .zero)
        setupAppearance()
        setupConstraints()
    }

    required init?(coder: NSCoder) { nil }

    private lazy var stackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [activity])
        if let message = message, !message.isEmpty {
            view.addArrangedSubview(messageLabel)
        }
        view.axis = .horizontal
        view.alignment = .fill
        view.distribution = .fill
        view.spacing = 12
        return view
    }()

    private lazy var activity: UIActivityIndicatorView = {
        UIActivityIndicatorView(style: .medium)
    }()

    private lazy var messageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = message
        label.font = UIFont.preferredFont(forTextStyle: .subheadline).bold
        return label
    }()
}

private extension MPLoadingHUD {
    func setupAppearance() {
        addSubview(stackView)
        activity.startAnimating()
    }

    func setupConstraints() {
        stackView.pinToEdges(insets: UIEdgeInsets(top: 18, left: 18, bottom: 18, right: 18))
    }
}
