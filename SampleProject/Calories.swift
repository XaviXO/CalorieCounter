//
//  Calories.swift
//  SampleProject
//
//  Created by Javier Calderon Jr. on 12/29/19.
//  Copyright © 2019 MySamples. All rights reserved.
//

import Foundation

class Calories {
    var foodList: FoodList!

    init(foodList: FoodList) {

        self.foodList = foodList
    }

    func getCalorieTotal() -> Float {
        var subtotal: Float = 0
        if foodList.selectedOption == 1 {
            subtotal = subtotal + (Float(foodList.calories))
        } else {
            fatalError("The impossible happend")
        }
        return subtotal
    }
}
