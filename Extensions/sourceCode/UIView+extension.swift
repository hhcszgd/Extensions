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
    func shake()  {
        let anima : CAKeyframeAnimation  =  CAKeyframeAnimation(keyPath: "transform.rotation")
        anima.values = [-Double.pi/180*4 , Double.pi/180*4 ,-Double.pi/180*4 ]
        anima.repeatCount = MAXFLOAT;
        self.layer.add(anima, forKey: "xx")
        //        view.layer.removeAnimation(forKey: "xx")
    }
    func moveAlongAngleWithAnimate() {
        let startPoint=CGPoint(x:50,y: 300)//自定义
        let endPoint=CGPoint(x:300, y:300)//自定义
        let controlPoint1=CGPoint(x:120,y: 180)//自定义
        let controlPoint2=CGPoint(x:220,y: 420)//自定义
        let path=UIBezierPath()
        path.move(to: startPoint)
        path.addCurve(to: endPoint, controlPoint1: controlPoint1, controlPoint2: controlPoint2)
        let animation = CAKeyframeAnimation()
        animation.duration=1
        animation.path = path.cgPath
        animation.timingFunction = CAMediaTimingFunction(name: "easeOut")
        self.layer.add(animation, forKey: "position")
    }
}
