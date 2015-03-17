//
//  LightContainerView.swift
//  LightsOff
//
//  Created by 张宇 on 15-1-14.
//  Copyright (c) 2015年 zhangyu. All rights reserved.
//

import UIKit

class LightContainerView: UIView {
    
    var rowNumber: Int = 5
    var columnNumber: Int = 5
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupUI()
    }
    
    private func setupUI() {
        var width = self.frame.size.width
        var height = self.frame.size.height
        var perWidth: CGFloat = width / CGFloat(self.columnNumber)
        var perHeight: CGFloat  = width / CGFloat(self.rowNumber)
        
        for row in 0..<self.rowNumber {
            for column in 0..<self.columnNumber {
                var lightView = LightView(frame: CGRectMake(perWidth * CGFloat(column), perHeight * CGFloat(row), perWidth, perHeight))
                lightView.row = row
                lightView.column = column
                var gestureRecognizer = UITapGestureRecognizer(target: self, action: "ligthClicked:")
                lightView.addGestureRecognizer(gestureRecognizer)
                self.addSubview(lightView)
            }
        }
        self.tryAgain()
    }
    
    func ligthClicked(gestureRecognizer: UITapGestureRecognizer) {
        var lightView = gestureRecognizer.view as LightView
        var row: Int = lightView.row
        var column: Int = lightView.column
        
        // clicked
        self.toggleLight(row, column: column)
        // left
        self.toggleLight(row, column: column - 1)
        // top
        self.toggleLight(row - 1, column: column)
        // right
        self.toggleLight(row, column: column + 1)
        // bottom
        self.toggleLight(row + 1, column: column)
        
        self.checkAllLightOff();
    }
    
    private func toggleLight(row: Int, column: Int) {
        if row < 0 {
            return
        }
        if column < 0 {
            return
        }
        if row >= self.rowNumber {
            return
        }
        if column >= self.columnNumber {
            return
        }
        var subViews: Array = self.subviews as Array
        var intdex = row * self.rowNumber + column
        var lightView = subViews[intdex] as LightView
        lightView.lightToggle()
    }
    
    private func checkAllLightOff() {
        var result = false
        self.cycleBlock { (lightView) -> Void in
            if lightView.isLightOn() {
                result = true
            }
        }
        
        if !result {
            self.showCompleteDialog()
        }
    }
    
    private func showCompleteDialog() {
        var c = UIAlertView()
        var alert: UIAlertView = UIAlertView()
        alert.title = "提示"
        alert.addButtonWithTitle("确定")
        alert.message = "恭喜过关"
        
        alert.show()
    }
    
    private func cycleBlock(finished: (lightView: LightView) -> Void) {
        var subViews: Array = self.subviews as Array
        for row in 0..<self.rowNumber {
            for column in 0..<self.columnNumber {
                var intdex = row * self.rowNumber + column
                var lightView = subViews[intdex] as LightView
                finished(lightView: lightView);
            }
        }
    }
    
    func tryAgain() {
        self.cycleBlock { (lightView) -> Void in
            if arc4random() % 2 == 0 {
                lightView.lightOn()
            } else {
                lightView.lightOff()
            }
        }
    }
    
    func complete() {
        
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}