//
//  Cloth.swift
//  Test
//
//  Created by noObject on 2019/3/27.
//  Copyright © 2019 noObject. All rights reserved.
//
import Foundation

class Cloth {
    private var _texture: Material
    private var _width: Float = 2.0     //millimeters
    private var _layer: Int = -1        //From body to outside
    
    init(ClothTexture: Material, Clothwidth :Float) {
        _texture = ClothTexture
        _width = Clothwidth
    }
    
    func getTexture() -> Material {
        return _texture
    }
    
    func getWidth() -> Float {
        return _width
    }
    
    func getLayer() -> Int {
        return _layer
    }
    
    func setTexture(newTexture: Material){
        _texture = newTexture
    }
    
    func setWidth(newWidth: Float){
        _width = newWidth
    }
    
    func setLayer(newLayer: Int){
        _layer = newLayer
    }
    
    func displayClothInfo() {
        print("Cloth info:\n" +
              "\tWidth:\(_width) millimeters.\n" +
              "\tlayer:\(_layer).\n")
        _texture.displayTexture()
    }
}
