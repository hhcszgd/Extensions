//
//  UIView+extension.swift
//  TestColor
//
//  Created by WY on 2018/7/10.
//  Copyright © 2018年 WY. All rights reserved.
//

import UIKit
extension UIView{
    enum DDColorDirection {
        case horizontal
        case vertical
    }
    func backgroundColors(_ direction :DDColorDirection = .horizontal , colors : [UIColor]){
        let colorlayer: CAGradientLayer = CAGradientLayer()
        if direction == .horizontal {
            colorlayer.startPoint = CGPoint(x: 0, y: 0.5)
            colorlayer.endPoint = CGPoint(x: 1, y: 0.5)
        }else if direction == .vertical{
            colorlayer.startPoint = CGPoint(x: 0.5, y: 0)
            colorlayer.endPoint = CGPoint(x: 0.5, y: 1)
        }
        var cgColors = [CGColor]()
        
        for color  in colors {
            cgColors.append(color.cgColor)
        }
        colorlayer.colors = cgColors
        colorlayer.frame = self.bounds
        self.layer.addSublayer(colorlayer)
    }
    
    public func setCornerRedius(_ redius : CGFloat)  {
        self.layer.cornerRadius = redius
        self.layer.masksToBounds = true
    }
}
