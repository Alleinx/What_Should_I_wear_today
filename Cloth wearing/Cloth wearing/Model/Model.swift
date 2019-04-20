//
//  Model.swift
//  Cloth wearing
//
//  Created by noObject on 2019/4/15.
//  Copyright © 2019 noObject. All rights reserved.
//
import Foundation

class Model {
    private var person : Person
    private let judge_temperature_difference : Float = 3.5
    //If body abs(body optimum temperature - model result) > this number, then it's not acceptable.
    
    init(person : Person) {
        self.person = person
    }
    
    func judgeIfEnough(model_result : Float) -> String {
        
        if fabsf(model_result-person.getBodyOptimum()) > judge_temperature_difference {
            return "Not Enough!\nBody Optimum temperature: \(person.getBodyOptimum())\nModel result : \(model_result)"
        }
        
        return "Good!\nBody Optimum temperature: \(person.getBodyOptimum())\nModel result : \(model_result)"
    }
    
    func setPerson(newPerson : Person) {
        self.person = newPerson
    }
}
