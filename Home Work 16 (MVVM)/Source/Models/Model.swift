//
//  Model.swift
//  Home Work 16 (MVVM)
//
//  Created by Daniil Davidovich on 24.01.23.
//

import Foundation


struct Model: Hashable {
    var image: String?
    var title: String?
    var descriptionTitle: String?
    var priceLabel: String?
    var ageTitle: Int?
    var sexTitle: String?
    var colorTitle: String?
}

class ModelData {
     public var modelsData = [
        [Model(image: "magnifyingglass")],
        
        [Model(image: "houseIcon", title: "All"),
         Model(image: "dogIcon", title: "Dogs"),
         Model(image: "catIcon", title: "Cats"),
         Model(image: "fishIcon", title: "Fishes"),
         Model(image: "birdIcon", title: "Birds")],
        
        [Model(image: "dogImage", title: "Dog", descriptionTitle: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Dui sapien imperdiet semper",priceLabel: "100$", ageTitle: 2, sexTitle: "Male", colorTitle: "black"),
         Model(image: "catImage", title: "Cat", descriptionTitle: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Dui sapien imperdiet semper",priceLabel: "33$", ageTitle: 1, sexTitle: "Male", colorTitle: "Black"),
         Model(image: "fishImage", title: "Fish", descriptionTitle: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Dui sapien imperdiet semper",priceLabel: "10$", ageTitle: 3, sexTitle: "Male", colorTitle: "black"),
         Model(image: "birdImage", title: "Bird", descriptionTitle: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Dui sapien imperdiet semper",priceLabel: "12$", ageTitle: 1, sexTitle: "Male", colorTitle: "Multy"),]
    ]
}
