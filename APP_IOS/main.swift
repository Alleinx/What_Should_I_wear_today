//
//  main.swift
//  Test
//
//  Created by noObject on 2019/3/27.
//  Copyright © 2019 noObject. All rights reserved.
//

import Foundation

// For testing
    var container = [Material]()

    var wool = Wool()
    var cotton = Cotton()
    var silk = Silk()
    var chinlon = Chinlon()
    var terital = Terital()


    container.append(wool)
    container.append(cotton)
    container.append(silk)
    container.append(chinlon)
    container.append(terital)

    for texture in container {
        texture.displayTexture()
    }

    var shirt = Cloth(ClothTexture: cotton, Clothwidth: 3.42)
    shirt.setLayer(newLayer: 1)
    shirt.displayClothInfo()
