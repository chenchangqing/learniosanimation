//
//  ProgressCircleView.swift
//  example03
//
//  Created by green on 15/8/13.
//  Copyright (c) 2015年 com.chenchangqing. All rights reserved.
//

import UIKit

class ProgressCircleView: UIView {
    
    var lineWidth:CGFloat     = 1                     // 线宽（>0）
    {
        willSet {
            
            if newValue < 0 {
                
                shapeLayper.lineWidth = 0
            } else {
                
                shapeLayper.lineWidth = newValue
            }
        }
    }
    var lineColor             = UIColor.redColor()    // 线颜色
    {
        willSet {
            
            shapeLayper.strokeColor = newValue.CGColor
        }
    }
    var value:CGFloat         = 1                     // 进度值
        {
        willSet {
            
            if newValue <= 0 {
                
                shapeLayper.strokeEnd = 0
            } else if newValue <= 1 {
                
                shapeLayper.strokeEnd = newValue
            } else {
                
                shapeLayper.strokeEnd = 1
            }
        }
    }
    
    private var shapeLayper : CAShapeLayer!         // 层
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)!
        setup()
    }
    
    /** 
     * 配置层
     */
    private func setup() {
        
        if shapeLayper != nil {
            
            return
        }
        // 创建出CAShapeLayer
        shapeLayper         = CAShapeLayer()
        shapeLayper.frame   = self.bounds
        
        // 创建出贝塞尔曲线
        let path = UIBezierPath(ovalInRect: self.bounds)
        
        // 贝塞尔曲线与CAShapeLayer产生关联
        shapeLayper.path = path.CGPath
        
        // 基本配置
        shapeLayper.fillColor   = UIColor.clearColor().CGColor
        shapeLayper.lineWidth   = lineWidth
        shapeLayper.strokeColor = lineColor.CGColor
        shapeLayper.strokeEnd   = value
        
        // 添加到当前view
        self.layer.addSublayer(shapeLayper)
    }

}
