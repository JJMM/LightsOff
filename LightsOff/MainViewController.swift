//
//  ViewController.swift
//  LightsOff
//
//  Created by 张宇 on 15-1-14.
//  Copyright (c) 2015年 zhangyu. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.grayColor()
        self.title = "Light Off"
        
        var size = UIScreen.mainScreen().bounds.size
        var lightContainerView = LightContainerView(frame: CGRectMake(0, (size.height - size.width) / 2 , size.width, size.width))
        self.view.addSubview(lightContainerView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

