//
//  CreateTaskViewController.swift
//  Task Burner
//
//  Created by Andrei Nagy on 10/18/16.
//  Copyright © 2016 weheartswift.com. All rights reserved.
//

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
