//
//  BasicSegmentedControl.swift
//  CustomSegmentedControl
//
//  Created by sherry on 16/5/23.
//  Copyright © 2016年 sherry. All rights reserved.
//

import UIKit


class BasicSegmentedControl: UIView {

    /*
     如果要改变默认btn的值要先在创建方法里接收block回调的值，再改变默认的btn
     
     闭包传值：
     1.在A.swift中声明block：1）无参数返回值数据传递-- var block1:(() -> ())?
                           2) 有参数无返回值数据传递-- var block2:((String) -> ())?
     
     2.在点击方法里实现：1）block1!()    2)block2!("要传的字符串的值")
     
     3.在B.swift中实现：假设B中已经声明或实例化了A.swift的controller，即为a1，
     传值实现：1）a1.block1 = {//你要执行的代码}
             2）a1.block2 = {(str: String) in //你要执行的代码}
     
     
     */
    //闭包回调
    var pageNumberBlock: ((Int) -> ())?
    
    /*
     重写get、set方法来实现oc中的属性的setter方法的重写----不明白为毛这样写
     */
    
    //选中图片
    var _selectImg: UIImage?
    var selectImg: UIImage? {
    
        get {
        
            return _selectImg
            
        }
        
        set {
        
            _selectImg = self.selectImg
            self.selectImgV.image = _selectImg
        
        }
    
    }
    //默认选中的btn
    var _firstIndex: Int?
    var firstIndex: Int? {
    
        get {
        
            return _firstIndex
        
        }
        
        set {
        
            if _firstIndex >= 0 && _firstIndex < titles.count - 1 {
                let btn = self.viewWithTag(100 + _firstIndex!) as! UIButton
                self.btnAct(btn)
            }
        
        }
    
    }
    //标题数组
    var titles: [String]!
    //上一个btn
    var lastBtn: UIButton!
    //btn的宽度
    var width: CGFloat!
    //选中图片的imageView
    var selectImgV: UIImageView!

    //正常状态下
    var normalColor: UIColor!
    var normalTitleSize: CGFloat!
    
    //选中状态下
    var selectColor: UIColor!
    var selectTitleSize: CGFloat!
    
    init(frame: CGRect, titles:[String] ) {
        super.init(frame: frame)
        
        self.titles = titles
        width = self.frame.size.width / CGFloat(titles.count)
        
        variable()
        createImgView()
        createSegmentedControl(titles)
        
    }
    
    //初始化变量
    func variable() {
    
        //正常状态下
        normalColor = UIColor.whiteColor()
        normalTitleSize = 20
        
        //选中状态下
        selectColor = UIColor.orangeColor()
        selectTitleSize = 25
    
    }
    
    //创建imgView
    func createImgView() {
    
        selectImgV = UIImageView(frame: CGRectMake(0, self.frame.size.height - 3, width, 3))
        self.addSubview(selectImgV)
    
    }
    
    //创建segmentedControl，给view加上btn
    func createSegmentedControl(titles: [String]) {
    
        for i in 0..<titles.count {
            
            let x: CGFloat = CGFloat(i) * width
            let height: CGFloat = self.frame.size.height
            
            let btn = UIButton(frame: CGRectMake(x, 0, self.width, height))
            btn.setTitle(titles[i], forState: .Normal)
            btn.setTitleColor(normalColor, forState: .Normal)
            btn.setTitleColor(selectColor, forState: .Selected)
            btn.titleLabel?.font = UIFont.systemFontOfSize(normalTitleSize)
            btn.addTarget(self, action: #selector(btnAct), forControlEvents: .TouchUpInside)
            btn.tag = 100 + i
            self.addSubview(btn)
            
            if i == 0 {
                btn.selected = true
                btn.titleLabel?.font = UIFont.systemFontOfSize(selectTitleSize)
                self.lastBtn = btn
                
                //选中图片的位置
                self.selectImgV.frame = CGRectMake(btn.bounds.origin.x, self.frame.size.height - 3, self.width, 3)
            }
            
        }
    
    }
    
    //点击方法
    func btnAct(btn: UIButton) {
        
        if lastBtn != btn {
            lastBtn.selected = false
            lastBtn.titleLabel?.font = UIFont.systemFontOfSize(normalTitleSize)
            
            btn.selected = true
            btn.titleLabel?.font = UIFont.systemFontOfSize(selectTitleSize)
            
            //设置选中图片的位置
            UIView.animateWithDuration(0.3, animations: {
                self.selectImgV.transform = CGAffineTransformMakeTranslation(self.width * CGFloat(btn.tag - 100), 0)
            })
            
            pageNumberBlock!(btn.tag - 100)
        }
        
        lastBtn = btn
    
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
