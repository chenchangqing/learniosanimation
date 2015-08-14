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

    // MARK: -
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        containerViewHeight.constant = CGRectGetHeight(view.bounds) + 100
    }

    // MARK: - SETUP
    
    private func setup() {
        
        setupImages()
    }
    
    /**
     * 设置图片
     */
    private func setupImages() {
        
        // 描述
        label01 = UILabel(frame: CGRectMake(16, 36, CGRectGetWidth(view.bounds) - 32, 42))
        label01.text = "v5.0：利用带有透明通道的图片创建maskView"
        label01.textColor = UIColor.grayColor()
        label01.numberOfLines = 2
        containerView.addSubview(label01)
        
        // 底图
        baseImageView = UIImageView(frame: CGRectMake(16, CGRectGetMaxY(label01.frame) + 8, 150, 150))
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

}

