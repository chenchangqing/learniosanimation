//
//  ViewController.swift
//  example01
//
//  Created by green on 15/8/12.
//  Copyright (c) 2015年 com.chenchangqing. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // 视图01
    var view01              : UIView!
    let view01OriginalRect  = CGRectMake(16, 32, 100, 100)
    let view01OriginalColor = UIColor.redColor()
    var view01OriginalCenter: CGPoint!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 设置view01
        view01                  = UIView(frame: view01OriginalRect)
        view01.backgroundColor  = view01OriginalColor
        view01OriginalCenter    = view01.center
        view.addSubview(view01)
    }
    
    /**
     * 开始动画
     */
    @IBAction func startAnimation() {
        
//        typeOne()
        typeTwo()
    }
    
    /**
     * 结束动画
    */
    @IBAction func endAnimation() {
        
        view01.layer.removeAllAnimations()
        
        view01.center           = view01OriginalCenter
        view01.backgroundColor  = view01OriginalColor
        self.view01.transform   = CGAffineTransformMakeScale(1, 1)
        view01.alpha            = 1
        
    }
    
    /**
     * 执行动画方式01
     * 基本动画
     */
    private func typeOne() {
        
        UIView.animateWithDuration(2, animations: { () -> Void in
            
            self.view01.center          = self.view.center
            self.view01.backgroundColor = UIColor.magentaColor()
            self.view01.transform       = CGAffineTransformMakeScale(2, 2)
            self.view01.alpha           = 0.5
        })
    }
    
    /**
     * 执行动画方式02
     * 使用UIViewAnimationOptions执行动画
     */
    private func typeTwo() {
        
        UIView.animateWithDuration(2, delay: 0, options: UIViewAnimationOptions.CurveLinear | UIViewAnimationOptions.Repeat | UIViewAnimationOptions.Autoreverse, animations: { () -> Void in
            
            self.view01.center          = self.view.center
            self.view01.backgroundColor = UIColor.magentaColor()
            self.view01.transform       = CGAffineTransformMakeScale(2, 2)
            self.view01.alpha           = 0.5
        }) { (finished) -> Void in
            
            println("是否完成：\(finished)")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

