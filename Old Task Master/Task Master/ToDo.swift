//
//  ToDo.swift
//  Task Master
//
//  Created by Alexander Davis on 10/04/2017.
//  Copyright © 2017 Alexander Davis Computing and Media. All rights reserved.
//

import Foundation
import UIKit

class Todo: NSObject {
    var name :String?
    var desc: String?
    var reminderDate: String?
    // id which is set from firebase to uniquely identify it
    var uniqueId:String?
}
