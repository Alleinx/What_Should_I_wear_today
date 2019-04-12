//
//  Cloth.swift
//  Created by noObject on 2019/3/27.
//  Copyright © 2019 noObject. All rights reserved.
//

class Cloth {
    private var _texture: Texture
    private var _bodyWidth: Float = 2.0     //millimeters
//  private photo
    private var _armWidth : Float = 2.0
    
    init(clothTexture: Texture, body_width : Float, arm_width : Float) {
        _texture = clothTexture
        _bodyWidth = body_width
        _armWidth = arm_width
    }
    
    func getTexture() -> Texture {
        return _texture
    }
    
    func getBodyWidth() -> Float {
        return _bodyWidth
    }
    
    func getArmWidth() -> Float {
        return _armWidth
    }
    
    func setTexture(newTexture: Texture) {
        _texture = newTexture
    }
    
    func setBodyWidth(newWidth: Float) {
        _bodyWidth = newWidth
    }
    
    func setArmWidth(newWidth : Float) {
        _armWidth = newWidth
    }
    
    func displayClothInfo() {
        print("Cloth info:\n" +
              "\tbody width:\(_bodyWidth) millimeters," +
              "\tarm width:\(_armWidth) millimeters.\n")
        _texture.displayTexture()
    }
}
