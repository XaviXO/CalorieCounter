//
//  FoodListController.swift
//  SampleProject
//
//  Created by Javier J Calderon Jr on 12/29/19.
//  Copyright © 2019 MySamples. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore

class FoodListController: UIViewController{

    @IBOutlet weak var tableView: UITableView!

    @IBOutlet weak var calorieBtn: BadgeBarButtonItem

    var foodSetup: [FoodList] = []

    var selectedFood: FoodList?
    var calorieItems: [Calories] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self

    }
    // fetches Firebase Data
    func fetchProducts(_ completion: @escaping ([FoodList]) -> Void) {
        let ref = Firestore.firestore().collection("products")
        ref.addSnapshotListener { (snapshot, error) in
            guard error == nil, let snapshot = snapshot, !snapshot.isEmpty else {
                return
            }
            completion(snapshot.documents.compactMap( {FoodList(dictionary: $0.data())} ))
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? CalorieViewController {
            vc.selectedFood = self.selectedFood
            vc.calorieItems = self.calorieItems
        }
    }
}

extension ProductListController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productSetup.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FoodCell") as?
            FoodCell else { return UITableViewCell() }

        cell.configure(withFood: foodSetup[indexPath.row])

        //passes selected Item to CartVC
        let foodItem = foodSetup[indexPath.row]
        cell.addActionHandler = { (option: Int) in
            print("Option selected = \(option)")
            self.cartItems.append(Calories(foodList: calorieItem))
            foodItem.selectedOption = option
        }

        return cell
    }

}
