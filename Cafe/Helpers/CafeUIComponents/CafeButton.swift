//
//  CafeButton.swift
//  Cafe
//
//  Created by Aung Kyaw Phyo on 22/12/2024.
//

import Foundation
import UIKit

@IBDesignable
class CafeButton: UIButton {
    
    @IBInspectable
    var cornerRadiuc: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }
    
    private func configure() {
        self.setTitleColor(.appColor(.btnTextColor), for: .normal)
        self.backgroundColor = .appColor(.primaryColor)
        self.layer.cornerRadius = 22
    }
    
}
