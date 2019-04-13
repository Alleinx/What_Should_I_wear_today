//
//  Controller.swift
//  Cloth wearing
//
//  Created by noObject on 2019/4/13.
//  Copyright © 2019 noObject. All rights reserved.
//

class Controller {
    private var clothList = Array<Cloth>()  //store cloth
    private var weatherPanel : WeatherProxy
    private var person : Person
    private var model : Model
    private var serverProxy : Proxy
    
    init() {
        weatherPanel = WeatherProxy(place: "zhuhai")
        serverProxy = Proxy()
        person = Person(age: 20, height: 180)
        model = Model(proxy: serverProxy)
    }
    
    func updateWeatherData() {
        weatherPanel.updateWeatherData()
        
    }
    
    func addClothToclothList(at : Int){
        
    }
    
    func removeClothFromClothList(at : Int) -> Bool {
        
        return true
    }
    
    func judgeWearing() -> String {
//        model.checkIfWearingEnoughCloth()
        return "Condition confirmed."
    }
    
    func higherBodyOptimumTemp(by : Float) {
        person.setBodyOptimum(to: by + person.getBodyOptimum())
        print("current body optimum : \(person.getBodyOptimum())")
    }
    
    func lowerBodyOptimumTemp(by : Float) {
        person.setBodyOptimum(to: person.getBodyOptimum() - by)
        print("current body optimum : \(person.getBodyOptimum())")
    }
    
}
