//
//  ViewController.swift
//  example04
//
//  Created by green on 15/8/13.
//  Copyright (c) 2015年 com.chenchangqing. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private var gradientLayer   : CAGradientLayer!  // 测试CAGradientLayer坐标系
    
    // MARK: -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        
        // 延时3秒钟执行
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (Int64)(NSEC_PER_SEC * 3)), dispatch_get_main_queue()) { () -> Void in
            
            // 改变graditentLayer的分割点
            self.gradientLayer.locations = [0.01,0.5,0.99]
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - setup
    
    private func setup() {
        
        // 设置gradientLayer
        setup01()
    }
    
    // MARK: - CAGradientLayer坐标系相关
    
    private func setup01() {
        
        // 创建并初始化
        gradientLayer               = CAGradientLayer()
        gradientLayer.frame         = CGRectMake(16, 36, CGRectGetWidth(view.bounds) - 32, 50)
        gradientLayer.borderWidth   = 1
        
        view.layer.addSublayer(gradientLayer)
        
        // 设置颜色
        gradientLayer.colors = [UIColor.redColor().CGColor,UIColor.greenColor().CGColor,UIColor.blueColor().CGColor]
        
        // 设置颜色渐变方向
        gradientLayer.startPoint    = CGPointMake(0, 0)
        gradientLayer.endPoint      = CGPointMake(1, 0)
        
        // 设置颜色分割点
        gradientLayer.locations = [0.25,0.5,0.75]
        
    }

}

