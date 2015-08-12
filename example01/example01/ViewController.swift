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
    var view01              :UIView!
    let view01OriginalRect  = CGRectMake(16, 32, 100, 100)
    let view01OriginalColor = UIColor.redColor()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 设置view01
        view01                  = UIView(frame: view01OriginalRect)
        view01.backgroundColor  = view01OriginalColor
        view.addSubview(view01)
    }
    
    /**
     * 开始动画
     */
    @IBAction func startAnimation() {
        
        UIView.animateWithDuration(5, animations: { () -> Void in
            
            self.view01.frame.origin.y += 200
            self.view01.frame.origin.x += 100
            self.view01.backgroundColor = UIColor.magentaColor()
            self.view01.bounds          = CGRectMake(0, 0, 200, 200)
        })
    }
    
    /**
     * 结束动画
    */
    @IBAction func endAnimation() {
        
        view01.layer.removeAllAnimations()
        view01.frame            = view01OriginalRect
        view01.backgroundColor  = view01OriginalColor
        view01.bounds           = CGRectMake(0, 0, 100, 100)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

