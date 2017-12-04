//
//  Shakingself.swift
//  AnimationDemo
//
//  Created by Obi-Voin Kenobi on 12/3/17.
//  Copyright © 2017 Obi-Voin Kenobi. All rights reserved.
//

import UIKit

class ShakingTextField: UITextField {
    
    func shakeIt() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.05
        animation.repeatCount = 10
        animation.autoreverses = true
        animation.fromValue = CGPoint(x: self.center.x - 5, y: self.center.y)
        animation.toValue = CGPoint(x: self.center.x + 5, y: self.center.y)
        
        self.layer.add(animation, forKey: "position")
    }
    
}
