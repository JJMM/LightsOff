//
//  LightView.swift
//  LightsOff
//
//  Created by 张宇 on 15-1-14.
//  Copyright (c) 2015年 zhangyu. All rights reserved.
//

import UIKit

class LightView: UIView {
    
    var row: Int = 0
    var column: Int = 0
    
    private var imageView: UIImageView!
    private var lightStatus: Bool = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupUI()
    }
    
    private func setupUI() {
        self.imageView = UIImageView(frame: self.bounds)
        self.addSubview(self.imageView)
        self.lightOff();
    }
    
    func lightOn() {
        self.lightStatus = true
        self.imageView.image = UIImage(named: "LightOn")
    }
    
    func lightOff() {
        self.lightStatus = false
        self.imageView.image = UIImage(named: "LightOff")
    }
    
    func lightToggle() {
        if(self.lightStatus) {
            self.lightOff()
        } else {
            self.lightOn()
        }
    }
    
    func isLightOn() -> Bool {
        return self.lightStatus
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}