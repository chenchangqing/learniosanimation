//
//  ViewController03.swift
//  example04
//
//  Created by green on 15/8/14.
//  Copyright (c) 2015年 com.chenchangqing. All rights reserved.
//

import UIKit

class ViewController03: UIViewController {
    
    private var gradientLayer : CAGradientLayer!
    private var timer         : NSTimer!
    
    // MARK: -

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        
        // 添加定时器
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("timerEvent"), userInfo: nil, repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - SETUP
    
    private func setup() {
        
        // 设置背景色
        view.layer.contents = UIImage(named: "bg")?.CGImage
        
        // 渐变图层
        gradientLayer       = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        
        // 设置颜色
        gradientLayer.colors = [UIColor.clearColor().colorWithAlphaComponent(0).CGColor, UIColor.redColor().colorWithAlphaComponent(1).CGColor]
        gradientLayer.locations = [NSNumber(float: 0.7),NSNumber(float: 1)]
        
        // 添加渐变图层
        self.view.layer.addSublayer(gradientLayer)
    }
    
    func timerEvent() {
        
        gradientLayer.locations = [NSNumber(float: Float(arc4random()%100)/100),1]
        gradientLayer.colors = [UIColor.clearColor().colorWithAlphaComponent(0).CGColor,  UIColor(red: CGFloat(arc4random() % 255)/255, green: CGFloat(arc4random() % 255)/255, blue: CGFloat(arc4random() % 255)/255, alpha: 1).colorWithAlphaComponent(1).CGColor]
    }

}
