//
//  ViewController.swift
//  Cloth wearing
//  Created by noObject on 2019/4/9.
//  Copyright © 2019 noObject. All rights reserved.

import Cocoa
import Python

class ViewController: NSViewController {
    private let clothNum = 3
    private let empty_thickness : Float = 0.001

    private var serverProxy = Proxy()
    private var person = Person(age: 20, height: 180)
    
    lazy private var model = Model(person: person)
    
    lazy private var weatherPanel = WeatherProxy(place: "zhuhai", proxy: serverProxy)
    
    lazy private var thicknessList : [Float] = [empty_thickness, empty_thickness, empty_thickness] //store cloth width.
    
    lazy private var clothData = [[Float]](repeating: [Float](repeating: 0, count: 4), count: clothNum)
    //Data sends to server
    
    private var textureList : [Texture] = [Air(), Air(), Air()] //store texture.
    
    //UI components start below:
    @IBOutlet weak var thickness1: NSTextField!
    @IBOutlet weak var thickness2: NSTextField!
    @IBOutlet weak var thickness3: NSTextField!
    
    @IBOutlet weak var clothTexture1: NSPopUpButton!
    @IBOutlet weak var clothTexture2: NSPopUpButton!
    @IBOutlet weak var clothTexture3: NSPopUpButton!
    
    private let alertPanel : NSAlert = NSAlert() //alert panel
    
    //methods start below:
    
    
    @IBAction func checkEnough(_ sender: NSButton) {
        
        changeTexture(texture_name: clothTexture1.titleOfSelectedItem!, texture_index: 0)
        changeTexture(texture_name: clothTexture2.titleOfSelectedItem!, texture_index: 1)
        changeTexture(texture_name: clothTexture3.titleOfSelectedItem!, texture_index: 2)
        
        changeThickness(thickness: thickness1!.floatValue, thickness_index: 0)
        changeThickness(thickness: thickness2!.floatValue, thickness_index: 1)
        changeThickness(thickness: thickness3!.floatValue, thickness_index: 2)
        
        for i in 0..<clothNum {
            clothData[i][0] = Float(textureList[i].getDensity())
            clothData[i][1] = Float(textureList[i].getSpecialHeatCapacity())
            clothData[i][2] = Float(textureList[i].getThermalConductivity())
            clothData[i][3] = thicknessList[i]
        }
        
        let result = Float(serverProxy.get_service().getWearingResult(
                clothNum,
                weatherPanel.getTemperature(),
                clothData))!
        
        display_info(information: model.judgeIfEnough(model_result: result))
    }
    
    
    @IBAction func updateWeather(_ sender: NSButton) {
        weatherPanel.updateWeatherData()
        
        display_info(information: "Weather Updated!, new Temperature: \(weatherPanel.getTemperature())")
    }
    
    
    //Display information on alert panel
    private func display_info(information : String) {
        alertPanel.messageText = information
        alertPanel.alertStyle = NSAlert.Style.critical
        alertPanel.runModal()
    }
    
    //Set the thickness of given cloth.
    private func changeThickness(thickness : Float, thickness_index : Int) {
        if (thickness_index > clothNum - 1 || thickness_index < 0) {
            print("Error Thickness index")
            return
        }
        
        if thickness < 0 {
            print("Can't have negative thickness.")
            return
        }
        
        if (textureList[thickness_index].getTexture() != "Air") {
            if (thickness != 0) {
                thicknessList[thickness_index] = thickness
            }
        } else {
            thicknessList[thickness_index] = empty_thickness
        }
    }
    
    //Set the texture of given cloth.
    private func changeTexture(texture_name : String, texture_index : Int) {
        if (texture_index > clothNum - 1 || texture_index < 0) {
            print("Error Texture Index")
            return
        }
        
        if (texture_name == "None") {
            textureList[texture_index] = Air()
        
        } else if (texture_name == "Silk") {
            textureList[texture_index] = Silk()
        
        } else if (texture_name == "Terital") {
            textureList[texture_index] = Terital()
        
        } else if (texture_name == "Chinlon") {
            textureList[texture_index] = Chinlon()
        
        } else if (texture_name == "Cotton") {
            textureList[texture_index] = Cotton()
        
        } else {
            textureList[texture_index] = Wool()
        }
    }
}

