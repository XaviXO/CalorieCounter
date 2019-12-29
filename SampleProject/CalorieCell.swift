//
//  CalorieCell.swift
//  SampleProject
//
//  Created by Javier J Calderon Jr on 12/29/19.
//  Copyright © 2019 MySamples. All rights reserved.
//

import UIKit

class CalorieCell: UITableViewCell {

    weak var modifyDelegate: ModifyDelegate?
        var modifyItems: Calories!

        @IBOutlet weak var productImage: UIImageView!
        @IBOutlet weak var calorieLbl: UILabel!
        @IBOutlet weak var productName: UILabel!

        @IBOutlet weak var modifyBtn: RoundButton!

        override func awakeFromNib() {
            super.awakeFromNib()
            // Initialization code
        }

        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)

            // Configure the view for the selected state
        }

        func configure(withCalorieItems calorieItems: FoodList) {
            productImage.sd_setImage(with: URL(string: calorieItems.imageUrl))
            calorieLbl.text = "\(calorieItems.calories)"
            productName.text = "\(calorieItems.name)"
        }

        @IBAction func modifyActionButton(_ sender: AnyObject) {

        }
    }

