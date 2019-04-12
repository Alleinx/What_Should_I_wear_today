//
//  ViewController.swift
//  Cloth wearing
//
//  Created by noObject on 2019/4/9.
//  Copyright © 2019 noObject. All rights reserved.
//

import Cocoa
import Python

class ViewController: NSViewController {

    @IBOutlet weak var displayPatten: NSTextField!
    
    @IBAction func clickButton(_ sender: NSButtonCell) {
        
        let sys = Python.import("sys")
        
        displayPatten.stringValue = "\(sys.version)"
    }
    
    @IBAction func performUnitTest(_ sender: NSButton) {
        
        let wool = Wool()
        let cotton = Cotton()
        let silk = Silk()
        let chinlon = Chinlon()
        let terital = Terital()
        
        cotton.displayTexture()
        silk.displayTexture()
        chinlon.displayTexture()
        terital.displayTexture()
        
        let shirt = Coat(clothTexture: wool, body_width: 2, arm_width: 2)
        shirt.displayClothInfo()
        
        shirt.setArmWidth(newWidth: 3)
        shirt.setBodyWidth(newWidth: 3)
        shirt.setTexture(newTexture: cotton)
        
        print(shirt.getArmWidth())
        print(shirt.getBodyWidth())
        print(shirt.getTexture())
        
    }
    
}

