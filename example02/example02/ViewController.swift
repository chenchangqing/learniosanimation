//
//  ViewController.swift
//  example02
//
//  Created by green on 15/8/12.
//  Copyright (c) 2015年 green. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var view01 : UIView!
    var sublayer  : CALayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 初始化view01
        view01                  = UIView(frame: CGRectMake(16, 36, CGRectGetWidth(view.bounds) - 32, 3))
        view01.backgroundColor  = UIColor.redColor()
        
        // 初始化layer
        sublayer = CALayer()
        sublayer.backgroundColor   = UIColor.purpleColor().CGColor
        sublayer.frame             = CGRectMake(0, 0, 0, 3)
        
        // add view01
        view.addSubview(view01)
        
        // add layer
        view01.layer.addSublayer(sublayer)
        
        // 延迟3秒执行隐式动画
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (Int64)(NSEC_PER_SEC * 3)), dispatch_get_main_queue(), { () -> Void in
            
            self.sublayer.frame = CGRectMake(0, 0, 100, 3)
            self.sublayer.backgroundColor = UIColor.purpleColor().CGColor
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

