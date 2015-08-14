//
//  MulticolorView.swift
//  example04
//
//  Created by green on 15/8/14.
//  Copyright (c) 2015年 com.chenchangqing. All rights reserved.
//

import UIKit

/**
 * 圆形指示器
 */
class MulticolorView: UIView {
    
    var lineWidth   : CGFloat   = 1     // 圆线宽
    {
        willSet {
           
            if newValue > 0 {
                
                circleLayer.lineWidth = newValue
            }
        }
    }
    var duration    : Double    = 5     // 动画时间
    var percent     : CGFloat   = 1     // 百分比
    {
        willSet {
            
            if newValue >= 0 && newValue <= 1 {
                
                circleLayer.strokeEnd = percent
            }
        }
    }
    var colors      = [CGColor]()       // 渐变颜色
    {
        willSet {
            
            (self.layer as! CAGradientLayer).colors = newValue
        }
    }
    private var circleLayer : CAShapeLayer!
    
    // MARK: -
    
    override class func layerClass() -> AnyClass {
        
        return CAGradientLayer.self
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setup()
    }
    
    
    // MARK: - SETUP
    
    private func setup() {
        
        setup01()
        setup02()
    }
    
    /**
     * 设置当前的gradientLayer
     */
    private func setup01() {
        
        // 获取当前的layer
        let gradientLayer = self.layer as! CAGradientLayer
        
        // 给渐变色layer设置颜色
        for(var i:CGFloat=0; i<=360; i+=10) {
            
            colors.append(UIColor(hue: CGFloat(1*i/360), saturation: 1, brightness: 1, alpha: 1).CGColor)
        }
        gradientLayer.colors = colors
    }
    
    /**
     * 设置CAShapeLayer
     */
    private func setup02() {
        
        // 生产圆path
        let circleCenter = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds))
        let radius       = CGRectGetWidth(self.bounds)/2 - 2*lineWidth
        let circlePath   = UIBezierPath(arcCenter: circleCenter, radius: radius, startAngle: CGFloat(M_PI), endAngle: CGFloat(-M_PI), clockwise: false)
        
        // 生产圆layer
        circleLayer             = CAShapeLayer()
        circleLayer.path        = circlePath.CGPath
        circleLayer.strokeColor = UIColor.whiteColor().CGColor
        circleLayer.fillColor   = UIColor.clearColor().CGColor
        circleLayer.lineWidth   = lineWidth
        
        // 可以设置出圆的完整性
        circleLayer.strokeStart = 0
        circleLayer.strokeEnd   = 1
        
        // 生产一个圆形路径并设置成遮罩
        self.layer.mask = circleLayer
    }
    
    /** 
     * 开始动画
     */
    func startAnimation() {
        
        let animation = CABasicAnimation(keyPath: "transform.rotation.z")
        
        animation.duration      = duration
        animation.repeatCount   = MAXFLOAT
        animation.fromValue     = NSNumber(double: 0)
        animation.toValue       = NSNumber(double: M_PI * 2)
        
        self.layer.addAnimation(animation, forKey: nil)
    }
    
    /**
     * 结束动画
     */
    func stopAnimation() {
        
        self.layer.removeAllAnimations()
    }

}
