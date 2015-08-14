//
//  FadeLabel.swift
//  example05
//
//  Created by green on 15/8/14.
//  Copyright (c) 2015年 com.chenchangqing. All rights reserved.
//

import UIKit

class FadeLabel: UILabel {
    
    private var mask : UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setup()
    }
    
    // MARK: - setup
    
    private func setup() {
        
        // 创建渐变
        let gradientLayer           = CAGradientLayer()
        gradientLayer.frame         = self.bounds
        gradientLayer.colors        = [UIColor.clearColor().CGColor,UIColor.blackColor().CGColor,UIColor.blackColor().CGColor,UIColor.clearColor().CGColor]
        gradientLayer.locations     = [0.01,0.1,0.9,0.99]
        gradientLayer.startPoint    = CGPointMake(0, 0)
        gradientLayer.endPoint      = CGPointMake(1, 0)
        
        // 创建mask
        mask = UIView(frame: self.bounds)
        
        // mask add gradientLayer
        mask.layer.addSublayer(gradientLayer)
        
        // 设置mask
        self.maskView = mask
    }
    
    // MARK: -
    
    func animate() {
        
        UIView.animateWithDuration(1, delay: 2, options: UIViewAnimationOptions.CurveLinear | UIViewAnimationOptions.Repeat | UIViewAnimationOptions.Autoreverse, animations: { () -> Void in
            
            self.mask.x += self.bounds.size.width
        }) { (finished) -> Void in
                
        }
    }
}
