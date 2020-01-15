//
//  FinishGoalVC.swift
//  goalpost
//
//  Created by Min Thet Maung on 14/01/2020.
//  Copyright © 2020 Myanmy. All rights reserved.
//

import UIKit
import CoreData

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
        if pointsTextField.text != nil {
            self.save { (complete) in
                if complete {
                    dismiss(animated: true, completion: nil)
                }
            }
        }
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        dismissDetail()
    }
    
    func save(completion: (_ finished: Bool) -> ()) {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        let goal = Goal(context: managedContext)
        
        goal.goalProgress = Int32(0)
        goal.goalType = goalType.rawValue
        goal.goalDescription = goalDescription
        goal.goalCompletionValue = Int32(pointsTextField.text!)!
        
        do {
            try managedContext.save()
            print("save successully")
            completion(true)
        } catch {
            debugPrint("Could not save data : \(error.localizedDescription)")
            completion(false)
        }
    }
    
}
