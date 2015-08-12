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
    
    var view02              : UIView!
    let view02OriginalRect  = CGRectMake(16, CGRectGetHeight(UIScreen.mainScreen().bounds) - 148, 100, 100)
    let view02OriginalColor = UIColor.magentaColor()
    var view02OriginalCenter: CGPoint!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 设置view01
        view01                  = UIView(frame: view01OriginalRect)
        view01.backgroundColor  = view01OriginalColor
        view01OriginalCenter    = view01.center
        view.addSubview(view01)
        
        // 设置view02
        view02                  = UIView(frame: view02OriginalRect)
        view02.backgroundColor  = view02OriginalColor
        view02OriginalCenter    = view02.center
        view.addSubview(view02)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - 按钮事件
    
    /**
     * 开始动画
     */
    @IBAction func startAnimation() {
        
//        typeOne()
//        typeTwo()
//        typeThree()
        typeFour()
    }
    
    /**
     * 结束动画
    */
    @IBAction func endAnimation() {
        
        // 恢复view01
        view01.layer.removeAllAnimations()
        
        view01.center           = view01OriginalCenter
        view01.backgroundColor  = view01OriginalColor
        view01.transform        = CGAffineTransformMakeScale(1, 1)
        view01.alpha            = 1
        
        // 恢复view02
        view02.layer.removeAllAnimations()
        
        view02.center           = view02OriginalCenter
        view02.backgroundColor  = view02OriginalColor
        view02.transform        = CGAffineTransformMakeScale(1, 1)
        view02.alpha            = 1
        
    }
    
    // MARK: - 动画执行方式
    
    private func view01Operation() {
        
        self.view01.center          = self.view.center
        self.view01.backgroundColor = UIColor.magentaColor()
        self.view01.transform       = CGAffineTransformMakeScale(2, 2)
        self.view01.alpha           = 0.5
    }
    
    private func view02Operation() {
        
        self.view02.center          = self.view.center
        self.view02.backgroundColor = UIColor.redColor()
        self.view02.transform       = CGAffineTransformMakeScale(2, 2)
        self.view02.alpha           = 0.5
    }
    
    /**
     * 执行动画方式01
     * 基本动画
     */
    private func typeOne() {
        
        UIView.animateWithDuration(2, animations: { () -> Void in
            
            self.view01Operation()
        })
    }
    
    /**
     * 执行动画方式02
     * 使用UIViewAnimationOptions执行动画
     */
    private func typeTwo() {
        
        UIView.animateWithDuration(2, delay: 0, options: UIViewAnimationOptions.CurveLinear | UIViewAnimationOptions.Repeat | UIViewAnimationOptions.Autoreverse, animations: { () -> Void in
            
            self.view01Operation()
        }) { (finished) -> Void in
            
            println("view01Operation是否完成：\(finished)")
        }
    }
    
    /** 
     * 执行动画方式03
     * 使用Begin/Commit执行动画
     */
    private func typeThree() {
        
        // 开始动画并设置动画属性
        UIView.beginAnimations("begincommitAnimation", context: nil)
        UIView.setAnimationDuration(2)
        UIView.setAnimationRepeatAutoreverses(true)
        UIView.setAnimationRepeatCount(MAXFLOAT)
        UIView.setAnimationDelegate(self)
        UIView.setAnimationWillStartSelector(Selector("animationDidStart:"))
        UIView.setAnimationDidStopSelector(Selector("animationDidStop:finished:"))
        
        // 操作视图
        self.view01Operation()
        
        // 提交动画
        UIView.commitAnimations()
    }
    
    /**
     * 执行动画方式04
     * Nest嵌套动画执行
     */
    private func typeFour() {
        
        UIView.animateWithDuration(2, delay: 0, options: UIViewAnimationOptions.CurveLinear | UIViewAnimationOptions.Repeat | UIViewAnimationOptions.Autoreverse, animations: { () -> Void in
            
            self.view01Operation()
            
            UIView.animateWithDuration(6, delay: 0, options: UIViewAnimationOptions.CurveLinear | UIViewAnimationOptions.Repeat | UIViewAnimationOptions.Autoreverse | UIViewAnimationOptions.OverrideInheritedDuration, animations: { () -> Void in
                
                self.view02Operation()
            }) { (finished) -> Void in
                
                println("view02Operation是否完成：\(finished)")
            }
        }) { (finished) -> Void in
            
            println("view01Operation是否完成：\(finished)")
        }
    }
    
    // MARK: - begin/commit animation delegate
    
    override func animationDidStart(anim: CAAnimation!) {
    
        println("animationDidStart")
    }
    
    override func animationDidStop(anim: CAAnimation!, finished flag: Bool) {
        
        println("animationDidStop")
    }
}

