
//
//  Color+extension.swift
//  TestColor
//
//  Created by WY on 2018/7/10.
//  Copyright © 2018年 WY. All rights reserved.
//

import UIKit

extension UIColor {
    class var random : UIColor  {
        let r = CGFloat(arc4random_uniform(225)) / 255.0
        let g = CGFloat(arc4random_uniform(225)) / 255.0
        let b = CGFloat(arc4random_uniform(225)) / 255.0
        return UIColor(red: r, green: g, blue: b, alpha: 1)
    }
    static func gray(_ grayscale : CGFloat) -> UIColor {
        var gray = grayscale
        if gray > 1 {gray = 1}else if gray < 0 {gray = 0}
        gray = 1 - gray
        return  UIColor(red: gray, green: gray, blue: gray, alpha: 1)
    }
    class func colorWithHexStringSwift(_ colorStr:String) -> UIColor{
        if colorStr.characters.count < 6{
            return UIColor.clear
        }
        var color:String = colorStr
        
        //如果是0x开头的，那么截取字符串，字符串从索引为2的位置开始，一直到末尾
        if colorStr.hasPrefix("0x") {
            color  = colorStr.substring(from: colorStr.characters.index(colorStr.startIndex, offsetBy: 2))
        }
        //如果是#开头的，那么截取字符串，字符串从索引为1的位置开始，一直到末尾
        if colorStr.hasPrefix("#") {
            color = colorStr.substring(from: colorStr.characters.index(colorStr.startIndex, offsetBy: 1))
        }
        if color.characters.count != 6 {
            return UIColor.clear
        }
        let index = color.startIndex
        let index2 = color.characters.index(color.startIndex, offsetBy: 2)
        
        
        let red:String = color.substring(with: (index ..< index2))
        let green:String = color.substring(with: (color.characters.index(color.startIndex, offsetBy: 2) ..< color.characters.index(color.startIndex, offsetBy: 4)))
        let blue:String = color.substring(with: (color.characters.index(color.startIndex, offsetBy: 4) ..< color.characters.index(color.startIndex, offsetBy: 6)))
        var r:CUnsignedInt = 0 ,g:CUnsignedInt = 0, b:CUnsignedInt = 0
        Scanner(string: red).scanHexInt32(&r)
        Scanner(string: green).scanHexInt32(&g)
        Scanner(string: blue).scanHexInt32(&b)
        return UIColor(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: 1)
    }
    

}
