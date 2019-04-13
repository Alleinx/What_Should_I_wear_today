//
//  Cotton.swift
//  Created by noObject on 2019/3/27.
//  Copyright © 2019 noObject. All rights reserved.
//


class Cotton: Texture {
    var _density: Int = 1550
    var _specialHeatCapacity: Int = 1275
    var _thermalConductivity: Float = 0.072
    var _textureName: String = "Cotton"
    
    init() {}
    
    func getSpecialHeatCapacity() -> Int {
        return _specialHeatCapacity
    }
    
    func getDensity() -> Int {
        return _density
    }
    
    func getTexture() -> String {
        return _textureName
    }
    
    func getThermalConductivity() -> Float {
        return _thermalConductivity
    }
    
    func displayTexture() {
        print("Texture information:\n" +
              "\tTexture type: \(_textureName).\n" +
              "\tDensity: \(_density).\n" +
              "\tSpecial heat capacity: \(_specialHeatCapacity).\n" +
              "\tThermal conductivity: \(_thermalConductivity).\n")
    }
}
