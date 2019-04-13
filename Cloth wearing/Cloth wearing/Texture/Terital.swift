//
//  Wool.swift
//  Created by noObject on 2019/3/27.
//  Copyright © 2019 noObject. All rights reserved.
//


class Terital: Texture {
    var _density: Int = 1300
    var _specialHeatCapacity: Int = 1340
    var _thermalConductivity: Float = 0.084
    var _textureName: String = "Terital"
    
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
