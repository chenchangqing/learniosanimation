//
//  ProgressView.swift
//  example02
//
//  Created by green on 15/8/12.
//  Copyright (c) 2015年 green. All rights reserved.
//

import UIKit

class ProgressView: UIView {
    
    // 进度条
    private var progressLayer   : CALayer!
    
    // 进度条颜色
    var progressColor           = UIColor.greenColor().CGColor
    {
        willSet {
            progressLayer.backgroundColor = newValue
        }
    }
    
    // 进度
    var progressValue           : Float = 0
    {
        willSet {
            
            if newValue <= 0 {
                
                progressLayer.frame = CGRectMake(0, 0, 0, CGRectGetHeight(self.bounds))
            } else if newValue <= 1 {
                
                progressLayer.frame = CGRectMake(0, 0, CGRectGetWidth(self.bounds) * CGFloat(newValue), CGRectGetHeight(self.bounds))
            } else {
                
                progressLayer.frame = CGRectMake(0, 0, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds))
            }
        }
    }
    
    override init(frame:CGRect) {
        super.init(frame: frame)
        
        setup()
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)!
        
        setup()
    }
    
    /**
     * 设置layer
     */
    private func setup() {
        
        self.layer.borderWidth      = 1
        
        if progressLayer == nil {
            
            progressLayer                   = CALayer()
            progressLayer.frame             = CGRectMake(0, 0, 50, self.frame.size.height)
            progressLayer.backgroundColor   = progressColor
            
            self.layer.addSublayer(progressLayer)
        }
    }
}
