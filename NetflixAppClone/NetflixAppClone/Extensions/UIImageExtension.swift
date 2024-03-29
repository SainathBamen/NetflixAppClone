//
//  UIImageExtension.swift
//  NetflixAppClone
//
//  Created by mac on 3/9/24.
//

import UIKit

extension UIImageView{
    func makeRound(borderColor: CGColor? = nil, borderWidth: CGFloat = 2){
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor
        layer.cornerRadius = frame.height / 2.2
        clipsToBounds = true
        
    }
    func addGradient(startColor : CGColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor,                 endColor: CGColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor, at: UInt32 = 0){
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = [startColor, endColor]
        layer.insertSublayer(gradient, at: at)
        
    }
}
