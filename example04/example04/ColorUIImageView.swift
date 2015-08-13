//
//  ColorUIImageView.swift
//  example04
//
//  Created by green on 15/8/13.
//  Copyright (c) 2015年 com.chenchangqing. All rights reserved.
//

import UIKit

enum EColorDirection : Int {
    
    case FromUpToDown           = 0// 上->下
    case FromDownToUp           = 1// 下->上
    case FromRightToLeft        = 2// 右->左
    case FromLeftToRight        = 3// 左->右
}

class ColorUIImageView: UIImageView {
    
    private var gradientLayer : CAGradientLayer!
    
    /**
     * 颜色渐变方向
     */
    var direction = EColorDirection.FromUpToDown
    {
        willSet{
            
            switch (newValue) {
            case .FromUpToDown:
                
                gradientLayer.startPoint    = CGPointMake(0, 0)
                gradientLayer.endPoint      = CGPointMake(0, 1)
                break;
            case .FromDownToUp:
                
                gradientLayer.startPoint    = CGPointMake(0, 1)
                gradientLayer.endPoint      = CGPointMake(0, 0)
                break;
            case .FromRightToLeft:
                
                gradientLayer.startPoint    = CGPointMake(1, 0)
                gradientLayer.endPoint      = CGPointMake(0, 0)
                break;
            case .FromLeftToRight:
                
                gradientLayer.startPoint    = CGPointMake(0, 0)
                gradientLayer.endPoint      = CGPointMake(1, 0)
                break;

            default:
                
                gradientLayer.startPoint    = CGPointMake(0, 0)
                gradientLayer.endPoint      = CGPointMake(0, 1)
                break;
            }
        }
    }
    
    /**
     * 遮罩颜色 
     */
    var color     = UIColor.redColor() {
        
        willSet {
            
            gradientLayer.colors = [UIColor.clearColor().CGColor,color.CGColor]
        }
    }
    
    /**
     * 遮掩颜色百分比
     */
    var percent:CGFloat   = 0 {
        
        willSet {
            
            gradientLayer.locations = [1-percent,1]
        }
    }
    
    
    // MARK: -
    
    override init(frame:CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setup()
    }
    
    // MARK: - setup
    
    private func setup() {
        
        gradientLayer           = CAGradientLayer()
        gradientLayer.frame     = self.bounds
        gradientLayer.colors    = [UIColor.clearColor().CGColor,color.CGColor]
        gradientLayer.locations = [1-percent,1]
        
        gradientLayer.startPoint    = CGPointMake(0, 0)
        gradientLayer.endPoint      = CGPointMake(0, 1)
        
        self.layer.addSublayer(gradientLayer)
    }
}
