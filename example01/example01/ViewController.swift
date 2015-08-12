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
        
        UIView.animateWithDuration(2, animations: { () -> Void in
            
            self.view01.center          = self.view.center
            self.view01.backgroundColor = UIColor.magentaColor()
            self.view01.transform       = CGAffineTransformMakeScale(2, 2)
            self.view01.alpha           = 0.5
        })
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

