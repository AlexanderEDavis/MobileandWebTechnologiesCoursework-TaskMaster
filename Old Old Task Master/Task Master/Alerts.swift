//
//  Alerts.swift
//  Task Master
//
//  Created by Alexander Davis on 14/04/2017.
//  Copyright © 2017 Alexander Davis. All rights reserved.
//

import Foundation
import UIKit

extension UIAlertController {
    
    static func withError(error: NSError) -> UIAlertController {
        let alert = UIAlertController(title: "Error",
                                      message: error.localizedDescription,
                                      preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Ok",
                                         style: .default)
        alert.addAction(cancelAction)
        return alert
    }
}
