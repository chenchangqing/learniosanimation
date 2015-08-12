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
    
    // 视图01的子视图
    var view01Subview               : UIView!
    let view01SubviewRect           = CGRectMake(16, 16, 32, 32)
    let view01SubviewOriginalColor  = UIColor.purpleColor()
    var view01SubviewOriginalCenter : CGPoint!
    
    // 视图02
    var view02              : UIView!
    let view02OriginalRect  = CGRectMake(16, CGRectGetHeight(UIScreen.mainScreen().bounds) - 148, 100, 100)
    let view02OriginalColor = UIColor.magentaColor()
    var view02OriginalCenter: CGPoint!
    
    // 视图03,04
    var view03              : UIView!
    var view04              : UIView!
    
    // 子layer
    var layer               : CALayer!
    
    // MARK: -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 设置view01
        view01                  = UIView(frame: view01OriginalRect)
        view01.backgroundColor  = view01OriginalColor
        view01OriginalCenter    = view01.center
        view.addSubview(view01)
        
        // 设置view01的子视图
        view01Subview                   = UIView(frame: view01SubviewRect)
        view01Subview.backgroundColor   = view01SubviewOriginalColor
        view01SubviewOriginalCenter     = view01Subview.center
        view01.addSubview(view01Subview)
        
        // 设置view02
        view02                  = UIView(frame: view02OriginalRect)
        view02.backgroundColor  = view02OriginalColor
        view02OriginalCenter    = view02.center
        view.addSubview(view02)
        
        // 设置view03,04
        view03                  = UIView(frame: CGRectMake(16, CGRectGetMaxY(view01.frame) + 16, 100, 100))
        view03.backgroundColor  = UIColor.greenColor()
        
        view04                  = UIView(frame: CGRectMake(16, CGRectGetMaxY(view03.frame) + 16, 100, 100))
        view04.backgroundColor  = UIColor.grayColor()
        view.addSubview(view03)
        
        // 设置layer
        addSublayer()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - 结束动画
    
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
        
        // 恢复view01Subview
        view01Subview.layer.removeAllAnimations()
        self.view01Subview.center           = view01SubviewOriginalCenter
        self.view01Subview.backgroundColor  = view01SubviewOriginalColor
        self.view01Subview.alpha            = 1
        
        // 恢复view03
        for view in self.view.subviews {
            
            if view as! NSObject == view04 {
                
                view04.removeFromSuperview()
                self.view.addSubview(view03)
            }
        }
        
        // 恢复layer
        layer.removeAllAnimations()
        layer.frame = CGRectMake(CGRectGetMaxX(view03.frame) + 16, CGRectGetMaxY(view01.frame) + 16, 100, 100)
        
    }
    
    // MARK: - 操作视图
    
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
    
    private func view01SubviewOperation() {
        
        self.view01Subview.center           = CGPointMake(CGRectGetMidX(view01.frame) - CGRectGetMinX(view01.frame), CGRectGetMidY(view01.frame) - CGRectGetMinY(view01.frame))
        self.view01Subview.backgroundColor  = UIColor.greenColor()
        self.view01Subview.alpha            = 0.5
    }
    
    /**
     * 增加一个layer
     */
    private func addSublayer() {
        
        layer = CALayer()
        layer.backgroundColor = UIColor.magentaColor().CGColor
        layer.borderColor     = UIColor.grayColor().CGColor
        layer.borderWidth     = 5
        
        layer.cornerRadius    = 10
        layer.shadowColor     = UIColor.blackColor().CGColor
        layer.shadowOpacity   = 0.5
        layer.shadowOffset    = CGSizeMake(10, 10)
        layer.frame           = CGRectMake(CGRectGetMaxX(view03.frame) + 16, CGRectGetMaxY(view01.frame) + 16, 100, 100)
        
        view.layer.addSublayer(layer)
    }
    
    // MARK: - 开始动画
    
    /**
    * 执行动画方式01
    * 基本动画
    */
    @IBAction func typeOne() {
        
        UIView.animateWithDuration(2, animations: { () -> Void in
            
            self.view01Operation()
        })
    }
    
    /**
    * 执行动画方式02
    * 使用UIViewAnimationOptions执行动画
    */
    @IBAction func typeTwo() {
        
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
    @IBAction func typeThree() {
        
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
    @IBAction func typeFour() {
        
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
    
    /**
    * 执行动画方式05
    * 操作子视图执行转场动画
    */
    @IBAction func typeFive() {
        
        UIView.transitionWithView(self.view01Subview, duration: 2, options: UIViewAnimationOptions.TransitionCrossDissolve | UIViewAnimationOptions.AllowAnimatedContent, animations: { () -> Void in
            
            self.view01SubviewOperation()
        }) { (finished) -> Void in
            
            println("view01SubviewOperation是否完成：\(finished)")
        }
    }
    
    /**
     * 执行动画方式06
     * 替换子视图
     */
    @IBAction func typeSix() {
        
        UIView.transitionFromView(view03, toView: view04, duration: 1, options: UIViewAnimationOptions.TransitionCrossDissolve) { (finished) -> Void in
            
            println("view04 replace view03 是否完成：\(finished)")
        }
    }
    
    /** 
     * 执行动画方式07
     * 隐式动画
     */
    @IBAction func typeSeven() {
        
        layer.position.y += 116
    }
    
    /**
     * 执行动画方式08
     * 放大缩小显示动画
     */
    @IBAction func typeEight() {
        
        // 放大缩小动画类
        let scaleAnimation = CABasicAnimation(keyPath: "transform.scale")
        scaleAnimation.fromValue    = 1
        scaleAnimation.toValue      = 1.5
        scaleAnimation.autoreverses = true
        scaleAnimation.repeatCount  = MAXFLOAT
        scaleAnimation.duration     = 2
        
        // 透明度动画类
        let opacityAnimation = CABasicAnimation(keyPath: "opacity")
        opacityAnimation.fromValue      = 0.0
        opacityAnimation.toValue        = 1.0
        opacityAnimation.autoreverses   = true
        opacityAnimation.repeatCount    = MAXFLOAT
        opacityAnimation.duration       = 2
        
        // 增加动画
        layer.addAnimation(scaleAnimation, forKey: "scaleAnimation")
        layer.addAnimation(opacityAnimation, forKey: "opacityAnimation")
        
    }
    
    /**
     * 执行动画方式09
     * 关键帧动画
     */
    @IBAction func typeNine() {
        
        let layer = view01.layer
        
        // 关键帧动画类
        let keyFrameAnimation = CAKeyframeAnimation(keyPath: "position")
        
        // 关键轨迹
        let value01 = NSValue(CGPoint: layer.position)
        let value02 = NSValue(CGPoint: CGPointMake(CGRectGetMaxX(layer.frame) + 100, layer.position.y))
        let value03 = NSValue(CGPoint: CGPointMake(CGRectGetMaxX(layer.frame) + 100, CGRectGetMaxY(layer.frame) + 100))
        let value04 = NSValue(CGPoint: CGPointMake(layer.position.x, CGRectGetMaxY(layer.frame) + 100))
        let value05 = value01
        
        // 时间曲线
        let tf01    = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
        let tf02    = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        let tf03    = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        let tf04    = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        
        // 轨迹时间
        keyFrameAnimation.keyTimes          = [0.0,0.5,0.6,0.7,1]
        
        keyFrameAnimation.timingFunctions   = [tf01,tf02,tf03,tf04]
        keyFrameAnimation.values            = [value01,value02,value03,value04,value05]
        keyFrameAnimation.duration          = 3
        keyFrameAnimation.autoreverses      = false
        keyFrameAnimation.repeatCount       = MAXFLOAT
        
        layer.addAnimation(keyFrameAnimation, forKey: "keyFrameAnimation")
    }
    
    // MARK: - begin/commit animation delegate
    
    override func animationDidStart(anim: CAAnimation!) {
        
        println("animationDidStart")
    }
    
    override func animationDidStop(anim: CAAnimation!, finished flag: Bool) {
        
        println("animationDidStop")
    }
}

