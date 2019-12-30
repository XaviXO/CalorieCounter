//
//  FoodCell.swift
//  SampleProject
//
//  Created by Javier J Calderon Jr on 12/29/19.
//  Copyright © 2019 MySamples. All rights reserved.
//

import UIKit
import SDWebImage
import Firebase

class FoodCell: UITableViewCell {

    weak var food: FoodList!
    var addActionHandler: ((Int) -> Void)?

    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var foodName: UILabel!
    @IBOutlet weak var calorieLbl: UILabel!

    @IBOutlet weak var wpBtn: UIButton!

    @IBOutlet weak var atcBtn: UIButton!

    func configure(withFood food: FoodList) {
        foodName.text = food.name
        foodImage.sd_setImage(with: URL(string: food.imageUrl))
        calorieLbl.text = "\(food.calories)"
    }

    override func layoutSubviews() {
        super.layoutSubviews()

    }

    var lastSelectedButton = UIButton()
    @IBAction func cartTypeSelected(_ sender: UIButton) {
        lastSelectedButton.isSelected = false; do {
            self.lastSelectedButton.backgroundColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        } //Plus any deselect logic for this button
        lastSelectedButton = sender //If any buttons are not affect by this selection logic exclude them here
        sender.isSelected = true; do {
            self.lastSelectedButton.backgroundColor = #colorLiteral(red: 0.1058823529, green: 0.8745098039, blue: 0.6588235294, alpha: 1)     // color: 1BDFA8
        }
    }

    @IBAction func addToCart(_ sender: Any) {
        var i = 0
        switch lastSelectedButton {
        case wpBtn:
            i = 1
        default:
            i = 2
        }
        self.addActionHandler?(i)
    }
}
