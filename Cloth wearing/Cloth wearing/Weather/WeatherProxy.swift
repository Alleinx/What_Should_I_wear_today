//
//  Weather.swift
//  Created by noObject on 2019/4/1.
//  Copyright © 2019 noObject. All rights reserved.
//

class WeatherProxy {
    private var _humidity : Float = 0
    private var _wind_speed : Float = 0
    private var _temperature : Float = 0
    private var _place : String
    
    init(place: String) {
        _place = place
    }
    
    func getHumidity() -> Float {
        return _humidity
    }
    
    func getWindSpeed() -> Float {
        return _wind_speed
    }
    
    func getTemperature() -> Float {
        return _temperature
    }
    
    func getPlaceName() -> String {
        return _place
    }
    
    private func updateWeatherData() {
        //get Data from API of corresponding place
        //Parse the json data
        //update weather data
    }
}
