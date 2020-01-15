//
//  GoalCell.swift
//  goalpost
//
//  Created by Min Thet Maung on 14/01/2020.
//  Copyright © 2020 Myanmy. All rights reserved.
//

import UIKit

class GoalCell: UITableViewCell {

    @IBOutlet weak var goalDescriptionLbl: UILabel!
    @IBOutlet weak var goalTypeLbl: UILabel!
    @IBOutlet weak var goalProgressLbl: UILabel!
    
    func configureCell(goal: Goal) {
        self.goalTypeLbl.text = goal.goalType
        self.goalDescriptionLbl.text = goal.goalDescription
        self.goalProgressLbl.text = String(describing: goal.goalProgress)
    }
    
}
