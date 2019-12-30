//
//  ViewController.swift
//  SampleProject
//
//  Created by Javier J Calderon Jr on 12/29/19.
//  Copyright © 2019 MySamples. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseFirestore

class FoodList {
    var id: String
    var name: String
    var calories: Float
    var imageUrl: String
    var date: String
    var selectedOption: Int

    init(id: String,
         name: String,
         calories: Float,
         imageUrl: String,
         selectedOption: Int,
         date: String) {

        self.id = id
        self.name = name
        self.calories = calories
        self.imageUrl = imageUrl
        self.selectedOption = selectedOption
        self.date = date
    }

    convenience init(dictionary: [String : Any]) {
        let id = dictionary["id"] as? String ?? ""
        let name = dictionary["name"] as? String ?? ""
        let calories =  dictionary["calories"] as? Float ?? 0.0
        let imageUrl =  dictionary["imageUrl"] as? String ?? ""
        let selectedOption = dictionary["selectedOption"] as? Int ?? 00
        let date =  dictionary["date"] as? String ?? ""


        self.init(id: id,
                  name: name,
                  calories: calories,
                  imageUrl: imageUrl,
                  selectedOption: selectedOption,
                  date: date)
    }

}

