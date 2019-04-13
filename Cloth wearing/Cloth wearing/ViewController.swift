//
//  ViewController.swift
//  Cloth wearing
//  Created by noObject on 2019/4/9.
//  Copyright © 2019 noObject. All rights reserved.

import Cocoa
import Python

class ViewController: NSViewController {
    private var serverProxy = Proxy()
    private var person = Person(age: 20, height: 180)
    
    lazy private var weatherPanel = WeatherProxy(place: "zhuhai", proxy: serverProxy)
    lazy private var model = Model(proxy: serverProxy)

    
    @IBAction func checkEnough(_ sender: NSButton) {
        print(model.calculate())
        weatherPanel.updateWeatherData() //
        print("average temp: \(weatherPanel.getTemperature())")
    }
    
    @IBAction func updateWeather(_ sender: NSButton) {
        weatherPanel.updateWeatherData()
    }
    
}

