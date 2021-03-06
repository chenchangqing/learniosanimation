//
//  ViewController.swift
//  example03
//
//  Created by green on 15/8/13.
//  Copyright (c) 2015年 com.chenchangqing. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var starShapeLayer  : CAShapeLayer! // 五角星
    private var starPath01      : UIBezierPath! // 五角星曲线01
    private var starPath02      : UIBezierPath! // 五角星曲线02
    private var timer           : NSTimer!      // 时间控制
    private var i               = 0
    
    private var ovalLayer       : CAShapeLayer! // 椭圆
    private var rectLayer       : CAShapeLayer! // 矩形
    private var circleLayer     : CAShapeLayer! // 圆形
    
    private var progressLayer   : CAShapeLayer! // 圆形进度条
    private var timer2          : NSTimer!      // 时间控制
    
    private var progressView    : ProgressCircleView!    // 圆形进度条控件
    

    // MARK: -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        
        // 五角星定时执行动画
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("pathAnimation"), userInfo: nil, repeats: true)
        
        // 圆形进度条定制执行动画
        timer2 = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("animationEventTypeOne"), userInfo: nil, repeats: true)
        timer2 = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("animationEventTypeTwo"), userInfo: nil, repeats: true)
        
        // 延时1秒
         dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (Int64)(NSEC_PER_SEC * 1)), dispatch_get_main_queue()) { () -> Void in
            
            self.progressView.value = 1
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - setup
    
    private func setup() {
        
        view.backgroundColor = UIColor(red: 0.878, green: 0.878, blue: 0.878, alpha: 1)
        
        // 配置五角星
        setup01()
        
        // 设置椭圆、正圆、矩形
        setup02()
        
        // 设置圆形进度条
        setup03()
        
        // 设置圆形进度条（使用ProgressCircleView）
        setup04()
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
    
    // MARK: - UIBezierPath
    
    /**
     * 设置椭圆、矩形、正圆的层
     */
    private func setup02() {
        
        // 创建椭圆层 创建矩形层 创建正圆层
        ovalLayer           = CAShapeLayer()
        ovalLayer.frame     = CGRectMake(16, CGRectGetMaxY(starShapeLayer.frame) + 16, CGRectGetWidth(view.bounds) - 32, 50)
        
        rectLayer           = CAShapeLayer()
        rectLayer.frame     = CGRectMake(16, CGRectGetMaxY(ovalLayer.frame) + 16, CGRectGetWidth(view.bounds) - 32, 50)
        
        circleLayer         = CAShapeLayer()
        circleLayer.frame   = CGRectMake(16, CGRectGetMaxY(rectLayer.frame) + 16, CGRectGetWidth(view.bounds) - 32, 50)
        
        // 分别创建塞尔曲线
        let oval            = UIBezierPath(ovalInRect: CGRectMake(0, 0, 100, 50))
        let rect            = UIBezierPath(rect: rectLayer.bounds)
        let circle          = UIBezierPath(ovalInRect: CGRectMake(0, 0, CGRectGetHeight(circleLayer.bounds), CGRectGetHeight(circleLayer.bounds)))
        
        // 分别显示CAShapeLayer的边界
        ovalLayer.borderWidth       = 1
        rectLayer.borderWidth       = 1
        circleLayer.borderWidth     = 1
        
        // 分别禁止内容显示超出CAShapeLayer的frame值
        ovalLayer.masksToBounds     = true
        rectLayer.masksToBounds     = true
        circleLayer.masksToBounds   = true
        
        // 分别修改贝塞尔曲线的填充颜色
        ovalLayer.fillColor         = UIColor.redColor().CGColor
        rectLayer.fillColor         = UIColor.redColor().CGColor
        circleLayer.fillColor       = UIColor.redColor().CGColor
        
        // 分别建立贝塞尔曲线与CAShapeLayer之间的关联
        ovalLayer.path      = oval.CGPath
        rectLayer.path      = rect.CGPath
        circleLayer.path    = circle.CGPath
        
        // 分别添加并显示
        view.layer.addSublayer(ovalLayer)
        view.layer.addSublayer(rectLayer)
        view.layer.addSublayer(circleLayer)
        
    }
    
    // MARK: - 圆形进度条动画
    
    /**
     * 设置圆形进度条
     */
    private func setup03() {
        
        // 创建CAShapeLayer
        progressLayer       = CAShapeLayer()
        progressLayer.frame = CGRectMake(16, CGRectGetMaxY(circleLayer.frame) + 16, CGRectGetWidth(view.bounds) - 32, 100)
        
        // 创建圆形贝塞尔曲线
        let oval = UIBezierPath(ovalInRect: CGRectMake(0, 0, 100, 100))
        
        // 修改CAShapeLayer的线条相关值
        progressLayer.fillColor         = UIColor.clearColor().CGColor
        progressLayer.strokeColor       = UIColor.redColor().CGColor
        progressLayer.lineWidth         = 2
        progressLayer.strokeStart       = 0
        progressLayer.strokeEnd         = 0
        
        // 建立贝塞尔曲线与CAShapeLayer之间的关联
        progressLayer.path = oval.CGPath
        
        // 添加并显示
        view.layer.addSublayer(progressLayer)
    }
    
    /**
     * 动画01
     */
    func animationEventTypeOne() {
        
        progressLayer.strokeEnd = CGFloat(arc4random() % 100) / 100
    }
    
    /**
     * 动画02
     */
    func animationEventTypeTwo() {
        
        let valueOne = CGFloat(arc4random() % 100) / 100
        let valuTwo = CGFloat(arc4random() % 100) / 100
        
        progressLayer.strokeStart = valueOne < valuTwo ? valueOne : valuTwo
        progressLayer.strokeEnd   = valueOne > valuTwo ? valueOne : valuTwo
    }
    
    // MARK: - 圆形进度条控件
    
    /**
     * 设置圆形进度条控件
     */
    private func setup04() {
        
        progressView            = ProgressCircleView(frame: CGRectMake(16, CGRectGetMaxY(progressLayer.frame) + 16, 100, 100))
        progressView.value      = 0.75
        progressView.lineWidth  = 2
        progressView.lineColor  = UIColor.purpleColor()
        
        view.addSubview(progressView)
    }

}

