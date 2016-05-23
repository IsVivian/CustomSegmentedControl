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
       
        view2 = UIView(frame: self.view.bounds)
        view2.backgroundColor = UIColor.redColor()
        self.view.addSubview(view2)
        self.view.addSubview(view1)

        //创建分段控制器
        let segmentedControl = BasicSegmentedControl(frame: CGRectMake(0, 20, self.view.frame.size.width, 44), titles: ["View1", "View2"])
        
        segmentedControl.pageNumberBlock = {(num: Int) in
        
            self.changeView(num)
            
        }
        
        segmentedControl.firstIndex = 0
        
        self.navigationItem.titleView = segmentedControl
        
    }
    
    func changeView(num: Int) {
    
        if num == 0 {
            
            //让所有的view恢复原状
            UIView.animateWithDuration(0.2, animations: {
                
                self.view1.transform = CGAffineTransformIdentity
                self.view2.transform = CGAffineTransformIdentity
                
            })
            
        }else if num == 1 {
        
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

