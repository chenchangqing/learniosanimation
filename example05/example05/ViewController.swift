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
    private var maskView        : UIView!       // 遮罩
    

    // MARK: -
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        
        // 显示baseImageView2时，执行动画
        performAnimatiion()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        containerViewHeight.constant = CGRectGetHeight(view.bounds) + 100
    }

    // MARK: - SETUP
    
    private func setup() {
        
        setupImages()
        setupMaskViewUsingLayer()
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
        label02.text            = "v5.0：利用CAGradientLayer创建maskView"
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

    // MARK: -
    
    /** 
     * baseImageView2 -> maskView执行动画
     */
    private func performAnimatiion() {
        
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

}

