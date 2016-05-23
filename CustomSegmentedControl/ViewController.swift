//
//  ViewController.swift
//  CustomSegmentedControl
//
//  Created by sherry on 16/5/23.
//  Copyright © 2016年 sherry. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var view1: UIView!
    var view2: UIView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.backgroundColor = UIColor.cyanColor()
        
        
        view1 = UIView(frame: self.view.bounds)
        view1.backgroundColor = UIColor.greenColor()
       
        view2 = UIView(frame: CGRectMake(0, self.view.bounds.size.width, self.view.bounds.size.width, self.view.bounds.size.height))
        view2.backgroundColor = UIColor.redColor()
        self.view.addSubview(view2)
        self.view.addSubview(view1)

        //创建分段控制器
        let segmentedControl = BasicSegmentedControl(frame: CGRectMake(0, 20, self.view.frame.size.width, 44), titles: ["View1", "View2"])
        
        segmentedControl.pageNumberBlock = {(num: Int) in
        
            //根据下标改变视图
            self.changeView(num)
            
        }
        
        //设置默认选中第一个视图
        segmentedControl.firstIndex = 0
        
        self.navigationItem.titleView = segmentedControl
        
    }
    
    func changeView(num: Int) {
    
        //判断点击btn的下标
        if num == 0 {
            
            //让所有的view恢复原状
            UIView.animateWithDuration(0.2, animations: {
                
                self.view1.transform = CGAffineTransformIdentity
                self.view2.transform = CGAffineTransformIdentity
                
            })
            
        }else if num == 1 {
        
            //所有的view移动一个屏幕的宽度
            UIView.animateWithDuration(0.2, animations: {
                
                self.view1.transform = CGAffineTransformMakeTranslation(-self.view.bounds.size.width, 0)
                self.view2.transform = CGAffineTransformMakeTranslation(-self.view.bounds.size.width, 0)
            })
        
        }
    
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

