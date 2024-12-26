//
//  UIColor+Extensions.swift
//  Cafe
//
//  Created by Aung Kyaw Phyo on 22/12/2024.
//

import UIKit

extension UIColor {
    
    static func appColor(_ name: AssetColor) -> UIColor? {
        return UIColor(named: name.rawValue)
    }
    
}
