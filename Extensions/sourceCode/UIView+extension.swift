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
    func scaleAnimate() {
        //缩放动画
        let animation = CAKeyframeAnimation(keyPath: "transform.scale")
        animation.values = [1.0,0.5,1.5,1.0];
        animation.duration = 2
        animation.repeatCount = 3
        self.layer.add(animation, forKey: "")
    }
    
    func opacityAnimation()  {
        //透明度动画
        let animation = CABasicAnimation(keyPath: "opacity")
        animation.fromValue = 1
        animation.toValue = 0
        animation.beginTime = 0
        animation.repeatCount = 1
        //保持动画执行完的状态
        animation.isRemovedOnCompletion = false
        animation.fillMode = kCAFillModeForwards
        animation.duration = 2
        self.layer.add(animation, forKey: "")
    }
    func animationGroup() {
        //透明度
        let opacityAnimation = CABasicAnimation(keyPath: "opacity")
        opacityAnimation.fromValue = 1
        opacityAnimation.toValue = 0
        //缩放
        let scaleAnimate = CAKeyframeAnimation(keyPath: "transform.scale")
        scaleAnimate.values = [1.0,0.5,1.5,1.0];
        //移动
        let startPoint=CGPoint(x:50,y: 300)
        let endPoint=CGPoint(x:300, y:300)
        let controlPoint1=CGPoint(x:120,y: 180)
        let controlPoint2=CGPoint(x:220,y: 420)
        let path=UIBezierPath()
        path.move(to: startPoint)
        path.addCurve(to: endPoint, controlPoint1: controlPoint1, controlPoint2: controlPoint2)
        let moveAnimation = CAKeyframeAnimation(keyPath: "position")
        moveAnimation.path = path.cgPath
        //        moveAnimation.timingFunction = CAMediaTimingFunction(name: "easeOut")
        //组
        let groupAnimation = CAAnimationGroup()
        groupAnimation.repeatCount = 1
        groupAnimation.duration = 2
        //保持动画执行完的状态
        groupAnimation.isRemovedOnCompletion = false
        groupAnimation.fillMode = kCAFillModeForwards
        
        groupAnimation.animations = [ moveAnimation , opacityAnimation , scaleAnimate]
//        self.layer.anchorPoint = CGPoint(x: 0, y: 0.5)
        self.layer.add(groupAnimation, forKey: "")
    }
    func transitionAnimate()  {
        // 1.创建核心动画
        let ca = CATransition()
        // 1.1动画过渡类型
        ca.type = "cube";
        // 1.2动画过渡方向
        ca.subtype =  kCATransitionFromRight
        // 1.3动画起点(在整体动画的百分比)
        //    ca.startProgress = 0.5;
        ca.endProgress = 0.5;
        // 动画时间
        ca.duration = 1;
        // 2.添加核心动画
        self.layer.add(ca , forKey: nil )
    }
}
