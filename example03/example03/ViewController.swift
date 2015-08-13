//
//  ViewController.swift
//  example03
//
//  Created by green on 15/8/13.
//  Copyright (c) 2015年 com.chenchangqing. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private var timer           : NSTimer!      // 时间控制
    private var i               = 0
    
    private var starShapeLayer  : CAShapeLayer! // 五角星
    private var starPath01      : UIBezierPath! // 五角星曲线01
    private var starPath02      : UIBezierPath! // 五角星曲线02

    // MARK: -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        
        // 定时执行动画
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("pathAnimation"), userInfo: nil, repeats: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - setup
    
    private func setup() {
        
        // 配置五角星
        setup01()
    }
    
    // MARK: - 五角星相关
    
    /**
     * 五角星相关设置
     */
    private func setup01() {
        
        // 创建bezierPath
        setupStarBezierPath01()
        setupStarBezierPath02()
        
        // 创建shapeLayer
        starShapeLayer              = CAShapeLayer()
        starShapeLayer.frame        = CGRectMake(16, 36, 45, 45)
        starShapeLayer.path         = starPath01.CGPath
        starShapeLayer.fillColor    = UIColor.clearColor().CGColor
        starShapeLayer.strokeColor  = UIColor.redColor().CGColor
        starShapeLayer.lineWidth    = 2
        starShapeLayer.backgroundColor = UIColor.purpleColor().CGColor
        
        view.layer.addSublayer(starShapeLayer)
    }
    
    /**
     * 五角星动画
     */
    func pathAnimation() {
        
        if (i++ % 2) == 0 {
            
            let circleAnim = CABasicAnimation(keyPath: "path")
            
            circleAnim.removedOnCompletion  = false
            circleAnim.duration             = 1
            circleAnim.fromValue            = starPath01.CGPath
            circleAnim.toValue              = starPath02.CGPath
            starShapeLayer.path             = starPath02.CGPath
            
            starShapeLayer.addAnimation(circleAnim, forKey: "animateCirclePath")
            
        } else {
            
            let circleAnim = CABasicAnimation(keyPath: "path")
            
            circleAnim.removedOnCompletion  = false
            circleAnim.duration             = 1
            circleAnim.fromValue            = starPath02.CGPath
            circleAnim.toValue              = starPath01.CGPath
            starShapeLayer.path             = starPath01.CGPath
            
            starShapeLayer.addAnimation(circleAnim, forKey: "animateCirclePath")
            
        }
    }
    
    /** 
     * 贝塞尔曲线01
     */
    private func setupStarBezierPath01() {
        
        starPath01 = UIBezierPath()
        starPath01.moveToPoint(CGPointMake(22.5, 2.5))
        
        starPath01.addLineToPoint(CGPointMake(28.32, 14.49))
        starPath01.addLineToPoint(CGPointMake(41.52, 16.32))
        starPath01.addLineToPoint(CGPointMake(31.92, 25.56))
        starPath01.addLineToPoint(CGPointMake(34.26, 38.68))
        starPath01.addLineToPoint(CGPointMake(22.5, 32.4))
        starPath01.addLineToPoint(CGPointMake(10.74, 38.68))
        starPath01.addLineToPoint(CGPointMake(13.08, 25.56))
        starPath01.addLineToPoint(CGPointMake(3.48, 16.32))
        starPath01.addLineToPoint(CGPointMake(16.68, 14.49))
        
        starPath01.closePath()
    }
    
    /**
     * 贝塞尔曲线02
     */
    private func setupStarBezierPath02() {
        
        starPath02 = UIBezierPath()
        starPath02.moveToPoint(CGPointMake(22.5, 2.5))
        
        starPath02.addLineToPoint(CGPointMake(32.15, 9.21))
        starPath02.addLineToPoint(CGPointMake(41.52, 16.32))
        starPath02.addLineToPoint(CGPointMake(38.12, 27.57))
        starPath02.addLineToPoint(CGPointMake(34.26, 38.68))
        starPath02.addLineToPoint(CGPointMake(22.5, 38.92))
        starPath02.addLineToPoint(CGPointMake(10.74, 38.68))
        starPath02.addLineToPoint(CGPointMake(6.88, 27.57))
        starPath02.addLineToPoint(CGPointMake(3.48, 16.32))
        starPath02.addLineToPoint(CGPointMake(12.85, 9.21))
        
        starPath02.closePath()
    }


}

