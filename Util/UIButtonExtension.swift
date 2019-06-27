//
//  UIButtonExtension.swift
//  iOS Calculator
//
//  Created by Daniel Vázquez on 6/27/19.
//  Copyright © 2019 Bit Freelancer. All rights reserved.
//

import UIKit

extension UIButton {
    // Borde redondo
    func round() {
        layer.cornerRadius = bounds.height / 2
        clipsToBounds = true
    }
    
    // Brilla
    func shine() {
        UIView.animate(withDuration: 0.1, animations: {
            self.alpha = 0.5
        }) { (completion) in
            UIView.animate(withDuration: 0.1, animations: {
                self.alpha = 1
            })
        }
    }
}
