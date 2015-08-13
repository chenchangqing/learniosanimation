//
//  ViewController02.swift
//  example04
//
//  Created by green on 15/8/13.
//  Copyright (c) 2015年 com.chenchangqing. All rights reserved.
//

import UIKit

class ViewController02: UIViewController {

    private var dashCircleLayer : CAShapeLayer!     // 虚线圆环
    private var faucet          : CAGradientLayer!  // 渐变颜色层
    private let radius          : CGFloat          = 100
    private var timer           : NSTimer!
    
    // MARK: -
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("timerEvent"), userInfo: nil, repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - setup
    
    private func setup() {
        
        // 设置虚线圆环
        setup01()
        
        // 设置渐变层
        setup02()
    }
    
    func timerEvent() {
        
        faucet.colors = [
            UIColor(red: CGFloat(arc4random() % 255)/255, green: CGFloat(arc4random() % 255)/255, blue: CGFloat(arc4random() % 255)/255, alpha: 1).CGColor,
            UIColor(red: CGFloat(arc4random() % 255)/255, green: CGFloat(arc4random() % 255)/255, blue: CGFloat(arc4random() % 255)/255, alpha: 1).CGColor,
            UIColor(red: CGFloat(arc4random() % 255)/255, green: CGFloat(arc4random() % 255)/255, blue: CGFloat(arc4random() % 255)/255, alpha: 1).CGColor,
            UIColor(red: CGFloat(arc4random() % 255)/255, green: CGFloat(arc4random() % 255)/255, blue: CGFloat(arc4random() % 255)/255, alpha: 1).CGColor,
            UIColor(red: CGFloat(arc4random() % 255)/255, green: CGFloat(arc4random() % 255)/255, blue: CGFloat(arc4random() % 255)/255, alpha: 1).CGColor]
    }
    
    // MARK: - 设置虚线圆环
    
    private func setup01() {
        
        // 创建形状遮罩
        let startAngle          = CGFloat( (M_PI * 0  ) ) / 180
        let endAngle            = CGFloat( (M_PI * 360) ) / 180
        
        dashCircleLayer = CAShapeLayer.instance(circleCenter: CGPointMake(radius, radius), radius: radius - 8, startAngle: startAngle, endAngle: endAngle, clockwise: true, lineDashPattern: [10,10])
        
        dashCircleLayer.strokeColor = UIColor.blackColor().CGColor // 边缘线的颜色
        dashCircleLayer.lineCap     = kCALineCapSquare             // 边缘线的类型
        dashCircleLayer.lineWidth   = 4                            // 线条宽度
        dashCircleLayer.strokeStart = 0
        dashCircleLayer.strokeEnd   = 1
        
    }
    
    // MARK: - 设置渐变颜色层
    
    private func setup02() {
        
        // 创建渐变图层
        faucet = CAGradientLayer()
        faucet.frame = CGRectMake(0, 0, radius*2, radius*2)
        faucet.position = CGPointMake(CGRectGetWidth(view.bounds)/2, radius + 36)
        
        // 以CAShapeLayer的形状作为遮罩是实现特定颜色渐变的关键
        faucet.mask = dashCircleLayer
        faucet.colors = [
            UIColor.greenColor().CGColor,
            UIColor.redColor().CGColor,
            UIColor.cyanColor().CGColor,
            UIColor.purpleColor().CGColor,
            UIColor.yellowColor().CGColor
        ]
        
        // 设定动画时间
        faucet.speed = 0.5
        
        // 添加到系统图层中
        view.layer.addSublayer(faucet)
        
    }

}
