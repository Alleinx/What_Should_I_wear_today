//
//  Wool.swift
//  Created by noObject on 2019/3/27.
//  Copyright © 2019 noObject. All rights reserved.
//


class Wool: Texture {
    var _density: Int = 1300
    var _specialHeatCapacity: Int = 1360
    var _thermalConductivity: Float = 0.053
    var _textureName: String = "Wool"
    
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
