//
//  DeleteViewController.swift
//  SampleProject
//
//  Created by Javier J Calderon Jr on 12/29/19.
//  Copyright © 2019 MySamples. All rights reserved.
//

import UIKit

protocol DeleteRowInTableviewDelegate: NSObjectProtocol {
    func deleteRow(inTableview rowToDelete: Int)
}

class DeleteViewController: UIViewController {

    var modifyItems: Calories!
    var deleteItems: Calories?

    var delegate: DeleteRowInTableviewDelegate?

    @IBOutlet weak var deleteLbl: UILabel!

    @IBOutlet weak var deleteBtn: UIButton!
    @IBOutlet weak var cancelBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        if isMovingFromParent {
            delegate!.deleteRow(inTableview: 1)
        }
        deleteLbl.text = "Are you sure you want to delete this Food Item from your calorie List?"
    }

    @IBAction func decline(_ sender: Any) {
        dismiss(animated: true)
        delegate!.deleteRow(inTableview: 1)
        print("Delete Item")
    }

    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true)
        print("Cancel Delete")
    }
}
