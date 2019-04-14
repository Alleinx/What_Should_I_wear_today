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
    private var proxy : Proxy
    
    init(place: String, proxy : Proxy) {
        self._place = place
        self.proxy = proxy
        self.updateWeatherData()
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
    
    func updateWeatherData() {
        _temperature = Float(proxy.get_service().get_average_temp())!
    }
}
