//
//  FinishGoalVC.swift
//  goalpost
//
//  Created by Min Thet Maung on 14/01/2020.
//  Copyright © 2020 Myanmy. All rights reserved.
//

import UIKit

class FinishGoalVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var createGoalBtn: UIButton!
    @IBOutlet weak var pointsTextField: UITextField!
    
    var goalType: GoalType!
    var goalDescription: String!
    
    
    func initData(description: String, goalType: GoalType ) {
        self.goalType = goalType
        self.goalDescription = description
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createGoalBtn.bindToKeyboard()
        pointsTextField.delegate = self
    }
    
    @IBAction func createGoalBtnPressed(_ sender: Any) {
        
    }
    
}
