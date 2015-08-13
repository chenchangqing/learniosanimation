//
//  ViewController02.swift
//  example04
//
//  Created by green on 15/8/13.
//  Copyright (c) 2015年 com.chenchangqing. All rights reserved.
//

import UIKit

class ViewController02: UIViewController {

    private var dashCircleLayer : CAShapeLayer!     // 虚线圆环
    
    // MARK: -
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - setup
    
    private func setup() {
        
        // 设置虚线圆环
        setup01()
    }
    
    // MARK: - 设置虚线圆环
    
    private func setup01() {
        
        // 创建形状遮罩
        let startAngle = CGFloat( (M_PI * 0) ) / 180
        let endAngle   = CGFloat( (M_PI * 360) ) / 180
        dashCircleLayer = CAShapeLayer.instance(circleCenter: CGPointMake(CGRectGetWidth(view.bounds)/2, 50 + 36), radius: 50, startAngle: startAngle, endAngle: endAngle, clockwise: true, lineDashPattern: [10,10])
        
        dashCircleLayer.strokeColor = UIColor.blackColor().CGColor // 边缘线的颜色
        dashCircleLayer.lineCap     = kCALineCapSquare             // 边缘线的类型
        dashCircleLayer.lineWidth   = 4                            // 线条宽度
        dashCircleLayer.strokeStart = 0
        dashCircleLayer.strokeEnd   = 1
        
        dashCircleLayer.backgroundColor = UIColor.redColor().CGColor
        
        view.layer.addSublayer(dashCircleLayer)
    }

}
