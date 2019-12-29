//
//  CalorieViewController.swift
//  SampleProject
//
//  Created by Javier J Calderon Jr on 12/29/19.
//  Copyright © 2019 MySamples. All rights reserved.
//

import UIKit

class CalorieViewController: UIViewController {

    var selectedFood: FoodList!       // allows data to be passed into the CalorieVC
    var deleteItems: Calories?              // passes data to DeleteVC

    // allows data to be sepearted into sections
    var calorieItems: [Calories] = []
    var groupedCalorieItems: [String: [Calories]] = [:]
    var dateSectionTitle: [String] = []

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        tableView.dataSource = self
        tableView.delegate = self

        // Allows data in cells to seperate by section
        groupedCalorieItems = Dictionary(grouping: calorieItems, by: {$0.foodList.date})
        dateSectionTitle = groupedCalorieItems.map{$0.key}.sorted()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DeleteSegue" {
        let vc: DeleteViewController = segue.destination as! DeleteViewController
            vc.deleteItems = self.deleteItems
            vc.delegate = self

        }
    }
}

extension CalorieViewController: UITableViewDelegate, UITableViewDataSource{

    func numberOfSections(in tableView: UITableView) -> Int {
        return dateSectionTitle.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let date = dateSectionTitle[section]
        return groupedCalorieItems[date]!.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let calorieCell = tableView.dequeueReusableCell(withIdentifier: "CalorieCell") as! CalorieCell

        let date = dateSectionTitle[indexPath.section]
        let caloriesToDisplay = groupedCalorieItems[date]![indexPath.row]
        calorieCell.configure(withCalorieItems: caloriesToDisplay.foodList)

        return calorieCell
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let calorieHeader = tableView.dequeueReusableCell(withIdentifier: "CalorieHeader") as! CalorieHeader

        let headerTitle = dateSectionTitle[section]
        calorieHeader.dateLbl.text = "Date: \(headerTitle)"

        return calorieHeader
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 45
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let calorieFooter = tableView.dequeueReusableCell(withIdentifier: "CalorieFooter") as! CalorieFooter

        //Cell Total Code
        let date = dateSectionTitle[section]
        let subtotal = groupedCalorieItems[date]?.map { $0.getCalorieTotal() }.reduce(0, +) ?? 0

        calorieFooter.calorieTotal.text = String(subtotal!)

        return calorieFooter
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 150
    }

}

extension CalorieViewController: DeleteRowInTableviewDelegate {
    func deleteRow(inTableview rowToDelete: Int) {
        let picked = dateSectionTitle[rowToDelete]
        let selectedCell = groupedCalorieItems[dod]
        delete(selectedCell)

      //  calorieItems.remove(at: rowToDelete)  // tried using this and I get an error code upon segueing back to the CalorieVC
        tableView.reloadData()
    }
}
