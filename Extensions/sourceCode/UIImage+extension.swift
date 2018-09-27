//
//  UIImage+extension.swift
//
//
//  Created by wy on 2017/10/23.
//  Copyright © 2017年 wy. All rights reserved.
//

import UIKit

extension UIImage {
    class func ImageWithColor(color: UIColor, frame: CGRect) -> UIImage? {
        var aframe = CGRect.init(x: 0, y: 0, width: frame.size.width, height: frame.size.height)
        UIGraphicsBeginImageContext(frame.size)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.fill(aframe)
        let theImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return theImage
    }
    ///获取渐变图片
    class func getImage(startColor:UIColor , endColor:UIColor ,startPoint:CGPoint , endPoint:CGPoint , size:CGSize) -> UIImage?{
        let gradientLayer = CAGradientLayer.init()
        gradientLayer.frame = CGRect(origin: CGPoint.zero, size: size)
        gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        gradientLayer.render(in: UIGraphicsGetCurrentContext()!)
        let imageRet  = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return imageRet
    }
    
    func imageConvertToAttributedString(bounds:CGRect? = nil )->NSAttributedString{
        let achment : NSTextAttachment = NSTextAttachment.init()
        achment.image = self
        if bounds != nil {achment.bounds = bounds!}
        return NSAttributedString.init(attachment: achment)
    }
}
