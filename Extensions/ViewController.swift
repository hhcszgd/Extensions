//
//  ViewController.swift
//  Extensions
//
//  Created by WY on 2018/7/10.
//  Copyright © 2018年 WY. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        testDDAlertVC()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController{
    func testDDAlertVC() {
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2, execute: {
            let action = DDAlertAction(title: "hello", style: UIAlertActionStyle.default, handler: { (action ) in
                print(action._title)
            })
            action.isAutomaticDisappear = false
            
            let action2 = DDAlertAction(title: "hello2", style: UIAlertActionStyle.default, handler: { (action ) in
                print(action._title)
            })
//            let action3 = DDAlertAction(title: "hello3", style: UIAlertActionStyle.default, handler: { (action ) in
//                print(action._title)
//            })
//            let action4 = DDAlertAction(title: "hello4", style: UIAlertActionStyle.default, handler: { (action ) in
//                print(action._title)
//            })
//            
            
            let vi = DDAlertOrSheet(title: "ni hao shi jieni hao shi jieni hao shi jieni hao shi jieni hao shi jieni hao shi jieni hao shi jieni hao shi jieni hao shi jieni hao shi jieni hao shi jieni hao shi jieni hao shi jieni hao shi jieni hao shi jieni hao shi jieni hao shi jie", message: "及阿斯利康大姐夫;辣椒水;的浪费空间啊;哦IE;拉卡时间段;法拉克王嘉尔;我;我;i欧萨;了空间啊;数量的咖啡机;" , preferredStyle: UIAlertControllerStyle.alert, actions: [action,action2])
            vi.isHideWhenWhitespaceClick = false
            UIApplication.shared.keyWindow?.alert( vi)
        })
    }
}
