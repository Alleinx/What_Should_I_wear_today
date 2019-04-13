//
//  Person.swift
//  Created by noObject on 2019/4/1.
//  Copyright © 2019 noObject. All rights reserved.
//
// Different gender/age have different body optimum temperature.

class Person {
    private var _age : Int
    private var _height: Int
    private var body_optimum_temp : Float = 34.6    //degree centigrade
    
    init(age: Int, height: Int) {
        _age = age
        _height = height
    }
    
    func getAge() -> Int {
        return _age
    }
    
    func getHeight() -> Int {
        return _height
    }
    
    func setAge(age : Int) {
        _age = age
    }
    
    func setHeight(height : Int) {
        _height = height
    }
    
    func setBodyOptimum(to : Float) {
        body_optimum_temp = to
    }
    
    func getBodyOptimum() -> Float {
        return body_optimum_temp
    }
}
