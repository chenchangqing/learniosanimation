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
    
    private var axela           : UIImageView!      // 汽车
    private var axelaLayer      : CAGradientLayer!  // 汽车遮罩
    private var axeTimer        : NSTimer!
    
    private var colorView       : ColorUIImageView! // 自定义遮罩控件
    
    // MARK: -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        
        // 延时3秒钟执行
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (Int64)(NSEC_PER_SEC * 3)), dispatch_get_main_queue()) { () -> Void in
            
            // 改变graditentLayer的分割点
            self.gradientLayer.locations = [0.01,0.5,0.99]
        }
        
        // 定时执行axela汽车的遮罩动画
        axeTimer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("changeAxelaMask"), userInfo: nil, repeats: true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - setup
    
    private func setup() {
        
        // 设置gradientLayer
        setup01()
        
        // 设置汽车
        setup02()
        
        // 设置遮罩控件
        setup03()
    }
    
    func changeAxelaMask() {
        
        // 设定颜色组动画
        axelaLayer.colors = [UIColor.clearColor().CGColor, UIColor(red: CGFloat(arc4random() % 255)/255, green: CGFloat(arc4random() % 255)/255, blue: CGFloat(arc4random() % 255)/255, alpha: 1).CGColor]
        
        // 设定颜色分割点动画
        axelaLayer.locations = [CGFloat(arc4random()%10)/10, 1]
        
        // 修改遮罩控件属性
        colorView.percent   = CGFloat(arc4random() % 10) / 10
        colorView.color     = UIColor(red: CGFloat(arc4random() % 255)/255, green: CGFloat(arc4random() % 255)/255, blue: CGFloat(arc4random() % 255)/255, alpha: 1)
        // println(Int(arc4random() % 4))
        colorView.direction = EColorDirection(rawValue: Int(arc4random() % 4))!
        
    }
    
    // MARK: - CAGradientLayer坐标系相关
    
    private func setup01() {
        
        // 创建并初始化
        gradientLayer               = CAGradientLayer()
        gradientLayer.frame         = CGRectMake(16, 36, CGRectGetWidth(view.bounds) - 32, 30)
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
    
    // MARK: - 给汽车增加遮罩层
    
    private func setup02() {
        
        // 创建UIImageView
        axela       = UIImageView(frame: CGRectMake(16, CGRectGetMaxY(gradientLayer.frame) + 16, CGRectGetWidth(gradientLayer.frame), CGRectGetWidth(gradientLayer.frame) * (2/3)))
        axela.image = UIImage(named: "axela.jpg")
        view.addSubview(axela)
        
        // 初始化渐变层
        axelaLayer          = CAGradientLayer()
        axelaLayer.frame    = axela.bounds
        axela.layer.addSublayer(axelaLayer)
        
        // 设定颜色渐变方向
        axelaLayer.startPoint   = CGPointMake(0, 0)
        axelaLayer.endPoint     = CGPointMake(0, 1)
        
        // 设定颜色组
        axelaLayer.colors = [UIColor.clearColor().CGColor,UIColor.redColor().CGColor]
        
        // 设定颜色分割点
        axelaLayer.locations = [0.5, 1]
    }
    
    // MARK: - 使用ColorUIImageView自定义遮罩控件
    
    private func setup03() {
        
        colorView = ColorUIImageView(frame: CGRectMake(16, CGRectGetMaxY(axela.frame) + 16, CGRectGetWidth(axela.frame), CGRectGetWidth(axela.frame) * (2/3)))
        colorView.image = UIImage(named: "axela2.jpg")
        
        view.addSubview(colorView)
    }

}

