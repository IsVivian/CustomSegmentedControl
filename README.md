# CustomSegmentedControl
一款自定义的swift版本的segmentedControl

//调用方法

//创建分段控制器
        let segmentedControl = BasicSegmentedControl(frame: CGRectMake(0, 20, self.view.frame.size.width, 44), titles: ["View1", "View2"])
        
        segmentedControl.pageNumberBlock = {(num: Int) in
        
            //根据下标改变视图
            self.changeView(num)
            
        }
        
        //设置选中图片
        segmentedControl.selectImg = UIImage(named: "图片名字")
        
        //设置默认选中第一个视图
        segmentedControl.firstIndex = 0
        
        //设置为导航栏的titleView
        self.navigationItem.titleView = segmentedControl
