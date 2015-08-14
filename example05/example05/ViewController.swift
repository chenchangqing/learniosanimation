//
//  ViewController.swift
//  example05
//
//  Created by green on 15/8/14.
//  Copyright (c) 2015年 com.chenchangqing. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var baseImageView   : UIImageView!  // 底图
    private var maskImageView   : UIImageView!  // 遮罩图
    private var resultImageView : UIImageView!  // 结合后的图片

    // MARK: -
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        baseImageView = UIImageView(frame: CGRectMake(16, 36, 60, 60))
        baseImageView.image = UIImage(named: "base")
        view.addSubview(baseImageView)
        
        // mask
        maskImageView = UIImageView(frame: CGRectMake(CGRectGetMaxX(baseImageView.frame) + 16, 36, 60, 60))
        maskImageView.image = UIImage(named: "mask")
        view.addSubview(maskImageView)
        
        // 使用maskView的情况
        resultImageView             = UIImageView(frame: CGRectMake(CGRectGetMaxX(maskImageView.frame) + 16, 36, 60, 60))
        resultImageView.image       = UIImage(named: "base")
        let mask                    = UIImageView(frame: CGRectMake(0, 0, 60, 60))
        mask.image                  = UIImage(named: "mask")
        resultImageView.maskView    = mask
        view.addSubview(resultImageView)
    }

}

