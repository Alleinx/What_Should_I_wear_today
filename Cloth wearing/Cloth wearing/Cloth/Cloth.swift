//
//  Cloth.swift
//  Created by noObject on 2019/3/27.
//  Copyright © 2019 noObject. All rights reserved.
//

class Cloth {
    private var _texture: Texture
    private var _bodyWidth: Float    //millimeters
    private var _name : String
    private var _armWidth : Float
    
    init(clothTexture: Texture, name : String, body_width : Float, arm_width : Float) {
        _texture = clothTexture
        _bodyWidth = body_width
        _armWidth = arm_width
        self._name = name
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
    
    func getName() ->String {
        return _name
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
    
    func setName(newName: String) {
        self._name = newName
    }
    
    func displayClothInfo() {
        print("Cloth info:\n" +
              "\tbody width:\(_bodyWidth) millimeters," +
              "\tarm width:\(_armWidth) millimeters.\n")
        _texture.displayTexture()
    }
}
