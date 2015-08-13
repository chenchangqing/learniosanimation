//
//  FadeImageView.swift
//  example02
//
//  Created by green on 15/8/13.
//  Copyright (c) 2015年 green. All rights reserved.
//

import UIKit

class FadeImageView: UIView {
    
    let contentsAnimation   = CABasicAnimation(keyPath: "contents") // 动画

    var image               : UIImage?                              // 图片
    {
        didSet {
            
            // 如果之前值不为空，增加动画
            if oldValue != nil {
                
                addAnimation(image)
            }
            self.layer.contents = image?.CGImage
        }
    }
    
    private func addAnimation(newValue:UIImage?) {
    
        // 移除动画
        self.layer.removeAnimationForKey("contentsAnimation")
        
        // 设置动画
        contentsAnimation.fromValue = self.layer.contents
        contentsAnimation.toValue   = newValue?.CGImage
        contentsAnimation.duration  = 1
        
        // 增加动画
        self.layer.addAnimation(contentsAnimation, forKey: "contentsAnimation")
    }
    
}
