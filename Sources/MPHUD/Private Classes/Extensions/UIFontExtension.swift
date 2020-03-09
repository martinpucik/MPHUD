//
//  UIFontExtension.swift
//  MPHUD
//
//  Created by Martin Púčik on 09/03/2020.
//

import UIKit

extension UIFont {
    func withTraits(traits: UIFontDescriptor.SymbolicTraits) -> UIFont {
        let descriptor = fontDescriptor.withSymbolicTraits(traits)
        return UIFont(descriptor: descriptor!, size: 0)
    }

    var bold: UIFont { withTraits(traits: .traitBold) }
    var italic: UIFont { withTraits(traits: .traitItalic) }
}
