//
//  ViewController.swift
//  AnimationDemo
//
//  Created by Obi-Voin Kenobi on 12/3/17.
//  Copyright © 2017 Obi-Voin Kenobi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var animateTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customizeTextField(textField: animateTextField)
        animateTextField.delegate = self
    }

    func customizeTextField(textField: UITextField) {
        textField.layer.borderWidth = 2
        textField.layer.cornerRadius = 25
        
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 50))
        textField.leftViewRect(forBounds: CGRect(x: 0, y: 0, width: 20, height: 50))
        textField.leftViewMode = .always
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
  
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
//        UIView.animate(withDuration: 0.5) {
//            textField.frame.origin.y -= 100
//        }

        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.05
        animation.repeatCount = 10
        animation.autoreverses = true
        animation.fromValue = CGPoint(x: textField.center.x - 5, y: textField.center.y)
        animation.toValue = CGPoint(x: textField.center.x + 5, y: textField.center.y)

        textField.layer.add(animation, forKey: "position")
        
        return true
    }

    @IBAction func didTouchButton(_ sender: UIButton) {
        
        let scaleAnimation = CABasicAnimation(keyPath: "transform.scale.xy")
        scaleAnimation.fromValue = 1
        scaleAnimation.toValue = 1.5
        scaleAnimation.duration = 0.5
        
        let opacityAnimation = CAKeyframeAnimation(keyPath: "opacity")
        opacityAnimation.values = [0.4, 0.8, 0]
        opacityAnimation.keyTimes = [0, 0.2, 0.5]
        opacityAnimation.duration = 0.5
        
        let animationGroup = CAAnimationGroup()
        animationGroup.animations = [scaleAnimation, opacityAnimation]
        opacityAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionDefault)
        animationGroup.duration = 0.5
        animationGroup.repeatCount = 1
        
        let pulseLayer = CALayer()
        pulseLayer.backgroundColor = UIColor.gray.cgColor
        pulseLayer.opacity = 0
        pulseLayer.position = sender.center
        pulseLayer.bounds = sender.frame
        pulseLayer.cornerRadius = sender.layer.cornerRadius
        pulseLayer.add(animationGroup, forKey: "pulse")
        
        self.view.layer.insertSublayer(pulseLayer, below: sender.layer)
    }
}

