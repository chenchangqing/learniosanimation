//
//  ViewController.swift
//  example02
//
//  Created by green on 15/8/12.
//  Copyright (c) 2015年 green. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var view01          : UIView!               // 进度条01
    private var sublayer        : CALayer!              // 进度条01的sublayer
    
    private var timer           : NSTimer!              // 时间类
    
    private var progressView    : ProgressView!         // 进度条控件
    private var imageView       : FadeImageView!        // 淡入淡出控件
    private var imageLayer      : CALayer!              // 遮罩效果层

    // MARK: -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        
        progressView01()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - setup
    
    /**
     * 初始化
     */
    private func setup() {
        
        setup01()
        setup02()
        setup03()
        setup04()
    }
    
    /**
     * 普通进度条相关
     */
    private func setup01() {
        
        // 初始化view01
        view01                  = UIView(frame: CGRectMake(16, 36, CGRectGetWidth(view.bounds) - 32, 3))
        view01.backgroundColor  = UIColor.redColor()
        view.addSubview(view01)
        
        // 初始化layer
        sublayer                   = CALayer()
        sublayer.backgroundColor   = UIColor.purpleColor().CGColor
        sublayer.frame             = CGRectMake(0, 0, 0, 3)
        view01.layer.addSublayer(sublayer)
    }
    
    /**
     * 进度条控件相关
     */
    private func setup02() {
        
        // 初始化timer
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("progressView02"), userInfo: nil, repeats: true)
        
        // 初始化progressView
        progressView = ProgressView(frame: CGRectMake(16, CGRectGetMaxY(view01.frame) + 16, CGRectGetWidth(view.frame) - 32, 3))
        view.addSubview(progressView)
    }
    
    /**
     * 淡入淡出图片控件相关
     */
    private func setup03() {
        
        // 初始化imageView
        imageView = FadeImageView(frame: CGRectMake(16, CGRectGetMaxY(progressView.frame) + 16, CGRectGetWidth(view.frame) - 32, 200))
        imageView.image = UIImage(named: "起始图片")
        view.addSubview(imageView)
    }
    
    /**
     * 遮罩效果层相关
     */
    private func setup04() {
        
        // 处理图片
        let contentImage    = UIImage(named: "原始图片")
        let maskImage       = UIImage(named: "maskLayerContents")
        
        // 生成contentsLayer
        imageLayer          = CALayer()
        imageLayer.frame    = CGRectMake(16, CGRectGetMaxY(imageView.frame) + 16, CGRectGetWidth(view.frame) - 32, CGRectGetWidth(view.frame) - 32)
        imageLayer.contents = contentImage?.CGImage
        
        // 生成maskLayer
        let maskLayer       = CALayer()
        maskLayer.frame     = imageLayer.bounds
        maskLayer.contents  = maskImage?.CGImage
        
        // 给contentsLayer设定mask值
        imageLayer.mask     = maskLayer
        
        // 将contentsLayer添加到layer中
        view.layer.addSublayer(imageLayer)
    }
    
    // MARK: - operations
    
    /**
     * 延迟1秒执行
     */
    private func progressView01() {
        
        // 延迟3秒执行隐式动画
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (Int64)(NSEC_PER_SEC * 1)), dispatch_get_main_queue(), { () -> Void in
            
            // 改变进度条01的进度
            self.sublayer.frame = CGRectMake(0, 0, 100, 3)
            self.sublayer.backgroundColor = UIColor.purpleColor().CGColor
            
            // 改变imageView的图片
            self.imageView.image = UIImage(named: "结束图片")
        })
    }
    
    /**
     * 使用控件随机改变进度
     */
    func progressView02() {
        
        let progressValue = Float(arc4random() % 100) / 100
        progressView.progressValue = progressValue
    }
    
}

