//
//  CoatsContainer.swift
//  Created by noObject on 2019/4/1.
//  Copyright © 2019 noObject. All rights reserved.
//

class CoatsContainer {
    private var clothList : [Cloth] = []
    private var clothNumber : Int = 0
    
    func addCloth(toLayer : Int, cloth : Cloth) {
        
        if toLayer < 1 || (toLayer - 1) > clothNumber{
            print("Add Cloth to layer < 1")
            return
        }
        
        clothList.insert(cloth, at: toLayer - 1)
    }
    
    func deleteCloth(index : Int) {
        
    }
}
