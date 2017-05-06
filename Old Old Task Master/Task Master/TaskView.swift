//
//  TaskView.swift
//  Task Master
//
//  Created by Alexander Davis on 14/04/2017.
//  Copyright © 2017 Alexander Davis. All rights reserved.
//

import Foundation
import UIKit

class TaskViewController: UIViewController {
    
    var taskTitle: String?
    var taskCompleted: Bool?
    
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var completedSwitch: UISwitch!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.titleField.text = self.taskTitle ?? ""
        self.completedSwitch.setOn(taskCompleted ?? false, animated:false)
    }
    
    func updateValues() {
        self.taskTitle = self.titleField.text
        self.taskCompleted = self.completedSwitch.isOn
    }
}
