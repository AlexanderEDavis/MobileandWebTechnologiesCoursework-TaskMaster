//
//  TaskMaster.swift
//  Task Master
//
//  Created by Alexander Davis on 12/12/2016.
//  Copyright © 2016 Alexander Davis Computing and Media. All rights reserved.
//

import UIKit

var taskMgr: TaskManager = TaskManager()

struct task {
    var name = "not defined"
    var desc = "not defined"
}

class TaskManager: NSObject {
    var tasks = [task]()
    
    func addTask(_ name: String, desc: String){
        tasks.append(task(name: name, desc: desc))
    }
    
}

