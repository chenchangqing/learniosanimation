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
        
        // 底图
        baseImageView = UIImageView(frame: CGRectMake(16, 36, 200, 200))
        baseImageView.image = UIImage(named: "base")
        containerView.addSubview(baseImageView)
        
        // mask
        maskImageView = UIImageView(frame: CGRectMake(16, CGRectGetMaxY(baseImageView.frame) + 16, 200, 200))
        maskImageView.image = UIImage(named: "mask")
        containerView.addSubview(maskImageView)
        
        // 使用maskView的情况
        resultImageView             = UIImageView(frame: CGRectMake(16, CGRectGetMaxY(maskImageView.frame) + 16, 200, 200))
        resultImageView.image       = UIImage(named: "base")
        let mask                    = UIImageView(frame: CGRectMake(0, 0, 200, 200))
        mask.image                  = UIImage(named: "mask")
        resultImageView.maskView    = mask
        containerView.addSubview(resultImageView)
    }

}

