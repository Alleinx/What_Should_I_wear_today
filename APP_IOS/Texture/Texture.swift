//
//  Material.swift
//  Test
//
//  Created by noObject on 2019/3/27.
//  Copyright © 2019 noObject. All rights reserved.
//

protocol Texture {
    var _textureName: String {get}          //(Material name)
    var _specialHeatCapacity: Int {get}     //(kg.c)
    var _thermalConductivity: Float {get}   //(m.c)
    var _density: Int{get}                  //(kg/m^3)
    
    func getTexture() -> String
    func getSpecialHeatCapacity() -> Int
    func getThermalConductivity() -> Float
    func getDensity() -> Int
    func displayTexture()
}
