//
//  CustomUIButton.swift
//  BCPSwiftButton
//
//  Created by Alvaro Herrera on 6/19/18.
//

import UIKit

// MARK: Protocol

@objc public protocol CustomUIButtonDelegate {
    func didEndAnimation(button:UIButton)
}

@objcMembers public class CustomUIButton: UIButton {
    
    // MARK: Properties
    
    weak open var customDelegate:CustomUIButtonDelegate!
    
    // MARK: Overrides
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = 10;
    }
    
    // MARK: Methods
    
    public func customAnimationForButton () -> Void {
        self.performAnimation()
    }
    
    func performAnimation () -> Void {
        UIView.animate(withDuration: 1.0, animations: {
            self.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        },completion: {_ in UIView.animate(withDuration: 1.0) {
            self.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            self.customDelegate.didEndAnimation(button: self)
            }
        })
    }
    
}
