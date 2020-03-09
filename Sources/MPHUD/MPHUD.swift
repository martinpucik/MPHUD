//
//  MPHUD.swift
//  MPHUD
//
//  Created by Martin Púčik on 08/03/2020.
//

import UIKit

public enum MPHUD {
    case loading(_ message: String?)

    public static func show(_ hud: MPHUD) {
        DispatchQueue.global().async {
            DispatchQueue.main.async {
                MPHUDWindow.show(hud)
            }
        }
    }

    public static func hide() {
        MPHUDWindow.hide()
    }
}
