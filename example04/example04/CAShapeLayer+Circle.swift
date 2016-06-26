//
//  CAShapeLayer+Circle.swift
//  example04
//
//  Created by green on 15/8/13.
//  Copyright (c) 2015年 com.chenchangqing. All rights reserved.
//

import Foundation
import UIKit

extension CAShapeLayer {
    
    /**
     * dash circle 
     * 
     * @param circleCenter 圆心
     * @param radius       半径
     * @param startAngle   开始角度
     * @param endAngle     结束角度
     * @param clockwise    是否顺时针
     * @param lineDashPattern 虚线（线条宽度，空白宽度，线条宽度，空白宽度。。。。。。）
     * 
     * @return CAShapeLayer
     */
    class func instance(circleCenter:CGPoint, radius:CGFloat, startAngle:CGFloat, endAngle:CGFloat, clockwise:Bool, lineDashPattern:[NSNumber]) -> CAShapeLayer {
        
        let layer = CAShapeLayer()
        
        // 贝塞尔曲线(创建一个圆)
        let path = UIBezierPath(arcCenter: circleCenter, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: clockwise)
        
        // 设置path
        layer.path      = path.CGPath
        
        // 设置填充颜色为透明
        layer.fillColor = UIColor.clearColor().CGColor
        
        // 获取曲线分段的方式
        layer.lineDashPattern = lineDashPattern
        
        return layer
    }
    
    
    /**
     * dash circle
     *
     * @param circleCenter 圆心
     * @param radius       半径
     * @param startAngle   开始角度
     * @param endAngle     结束角度
     * @param clockwise    是否顺时针
     *
     * @return CAShapeLayer
     */
    class func instance(circleCenter:CGPoint, radius:CGFloat, startAngle:CGFloat, endAngle:CGFloat, clockwise:Bool) -> CAShapeLayer {
        
        let layer = CAShapeLayer()
        
        // 贝塞尔曲线(创建一个圆)
        let path = UIBezierPath(arcCenter: circleCenter, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: clockwise)
        
        // 设置path
        layer.path      = path.CGPath
        layer.position  = circleCenter
        layer.lineCap   = kCALineCapButt
        layer.lineWidth = radius
        
        // 设置填充颜色为透明
        layer.fillColor = UIColor.clearColor().CGColor
        
        return layer
    }
    
}