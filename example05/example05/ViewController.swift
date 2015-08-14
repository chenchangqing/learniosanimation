//
//  ViewController.swift
//  example05
//
//  Created by green on 15/8/14.
//  Copyright (c) 2015年 com.chenchangqing. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var containerViewHeight: NSLayoutConstraint!
    
    private var label01         : UILabel!      // 描述
    private var baseImageView   : UIImageView!  // 底图
    private var maskImageView   : UIImageView!  // 遮罩图
    private var resultImageView : UIImageView!  // 结合后的图片
    
    private var label02         : UILabel!      // 描述2
    private var baseImageView2  : UIImageView!  // 底图2
    private var maskView        : UIView!       // 遮罩2
    
    private var label03         : UILabel!      // 描述3
    private var maskView3       : UIView!       // 遮罩3
    private var frontImageView  : UIImageView!  // 前景图
    private var backImageView   : UIImageView!  // 背景图
    private var imageOne        : UIImageView!
    private var imageTwo        : UIImageView!
    
    private var fadeLabel       : FadeLabel!    // 渐变控件
    

    // MARK: -
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        
        // 显示baseImageView2时，执行动画
        performAnimation()
        
        // 切换图片
        performAnimation2()
        
        // 渐变控件动画
        fadeLabel.animate()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        containerViewHeight.constant = CGRectGetHeight(view.bounds) + 450
    }

    // MARK: - SETUP
    
    private func setup() {
        
        setupImages()
        setupMaskViewUsingLayer()
        setupMaskViewUsingImage()
        setupFadeLabel()
    }
    
    /**
     * 设置图片
     */
    private func setupImages() {
        
        // 描述
        label01                 = UILabel(frame: CGRectMake(16, 36, CGRectGetWidth(view.bounds) - 32, 42))
        label01.text            = "v5.0：利用带有透明通道的图片创建maskView"
        label01.textColor       = UIColor.grayColor()
        label01.numberOfLines   = 2
        containerView.addSubview(label01)
        
        // 底图
        baseImageView       = UIImageView(frame: CGRectMake(16, CGRectGetMaxY(label01.frame) + 8, 150, 150))
        baseImageView.image = UIImage(named: "base")
        containerView.addSubview(baseImageView)
        
        // mask
        maskImageView = UIImageView(frame: CGRectMake(16, CGRectGetMaxY(baseImageView.frame) + 8, 150, 150))
        maskImageView.image = UIImage(named: "mask")
        containerView.addSubview(maskImageView)
        
        // 使用maskView的情况
        resultImageView             = UIImageView(frame: CGRectMake(16, CGRectGetMaxY(maskImageView.frame) + 8, 150, 150))
        resultImageView.image       = UIImage(named: "base")
        let mask                    = UIImageView(frame: CGRectMake(0, 0, 150, 150))
        mask.image                  = UIImage(named: "mask")
        resultImageView.maskView    = mask
        containerView.addSubview(resultImageView)
    }
    
    /**
     * 使用CAGradientLayer设置maskView
     */
    private func setupMaskViewUsingLayer() {
        
        // 描述2
        label02                 = UILabel(frame: CGRectMake(16, CGRectGetMaxY(resultImageView.frame) + 8, CGRectGetWidth(view.bounds) - 32, 42))
        label02.text            = "v5.1：利用CAGradientLayer创建maskView"
        label02.textColor       = UIColor.grayColor()
        label02.numberOfLines   = 2
        containerView.addSubview(label02)
        
        // 底图2
        baseImageView2          = UIImageView(frame: CGRectMake(16, CGRectGetMaxY(label02.frame) + 8, 150, 150))
        baseImageView2.image    = UIImage(named: "base")
        containerView.addSubview(baseImageView2)
        
        // 创建CAGradientLayer
        let layer = CAGradientLayer()
        layer.frame = baseImageView2.bounds
        layer.colors = [UIColor.clearColor().CGColor,UIColor.blackColor().CGColor,UIColor.clearColor().CGColor]
        layer.locations = [0.25,0.5,0.75]
        layer.startPoint = CGPointMake(0, 0)
        layer.endPoint = CGPointMake(1, 0)
        
        // maskView
        maskView = UIView(frame: baseImageView2.bounds)
        maskView.layer.addSublayer(layer)
        
        // 给底图设置maskView
        baseImageView2.maskView = maskView
    }
    
    /**
     * 使用带alpha通道图片设置maskView
     */
    private func setupMaskViewUsingImage() {
        
        // 描述3
        label03                 = UILabel(frame: CGRectMake(16, CGRectGetMaxY(baseImageView2.frame) + 8, CGRectGetWidth(view.bounds) - 32, 42))
        label03.text            = "v5.2：使用带alpha通道图片设置maskView"
        label03.textColor       = UIColor.grayColor()
        label03.numberOfLines   = 2
        containerView.addSubview(label03)
        
        // 背景图
        backImageView = UIImageView(frame: CGRectMake(16, CGRectGetMaxY(label03.frame) + 8, 200, 200))
        backImageView.image = UIImage(named: "background")
        containerView.addSubview(backImageView)
        
        // 前景图
        frontImageView = UIImageView(frame: backImageView.frame)
        frontImageView.image = UIImage(named: "base")
        containerView.addSubview(frontImageView)
        
        // maskView
        maskView3 = UIView(frame: frontImageView.bounds)
        frontImageView.maskView = maskView3
        
        // alpha图片01
        imageOne = UIImageView(frame: CGRectMake(0, 0, 100, 400))
        imageOne.image = UIImage(named: "1")
        maskView3.addSubview(imageOne)
        
        // alpha图片02
        imageTwo = UIImageView(frame: CGRectMake(100, -200, 100, 400))
        imageTwo.image = UIImage(named: "2")
        maskView3.addSubview(imageTwo)
        
    }
    
    /**
     * 设置渐变控件FadeLabel
     */
    private func setupFadeLabel() {
        
        fadeLabel = FadeLabel(frame: CGRectMake(16, CGRectGetMaxY(frontImageView.frame) + 8, CGRectGetWidth(view.bounds) - 32, 42))
        fadeLabel.text = "v5.3：设置渐变控件FadeLabel,演示FadeLabel效果"
        fadeLabel.textColor = UIColor.grayColor()
        fadeLabel.numberOfLines = 2
        containerView.addSubview(fadeLabel)
    }

    // MARK: -
    
    /** 
     * baseImageView2 -> maskView执行动画
     */
    private func performAnimation() {
        
        var frame = maskView.frame
        frame.origin.x -= 150
        maskView.frame = frame
        
        UIView.animateWithDuration(1, delay: 0, options: UIViewAnimationOptions.CurveLinear | UIViewAnimationOptions.Repeat | UIViewAnimationOptions.Autoreverse, animations: { () -> Void in
            
            var frame = self.maskView.frame
            frame.origin.x += 300
            self.maskView.frame = frame
        }) { (finished) -> Void in
            
        }
    }
    
    /**
     * 图片切换动画
     */
    private func performAnimation2() {
        
        UIView.animateWithDuration(1, delay: 0, options: UIViewAnimationOptions.CurveLinear | UIViewAnimationOptions.Repeat | UIViewAnimationOptions.Autoreverse, animations: { () -> Void in
            
            self.imageOne.y -= 400
            self.imageTwo.y += 400
        }) { (finished) -> Void in
            
        }
    }

}

