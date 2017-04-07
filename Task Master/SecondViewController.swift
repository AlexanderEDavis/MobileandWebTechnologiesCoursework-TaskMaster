//
//  SecondViewController.swift
//  Task Master
//
//  Created by Alexander Davis on 12/12/2016.
//  Copyright © 2016 Alexander Davis Computing and Media. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var txtTask: UITextField!
    @IBOutlet var txtDesc: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnAddTask(_ sender : UIButton){
        if (txtTask.text == ""){
            //App won't add task if textbox is empty
        } else {
            //If above case is 'false', Task Master will create a task
            let name: String = txtTask.text!
            let description: String = txtDesc.text!
            taskMgr.addTask(name, desc: description)
            
            //Once Task is added, keyboard will be dismissed and form will reset
            
            self.view.endEditing(true)
            txtTask.text = nil
            txtDesc.text = nil
            
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func btnLocaionOffline(_ sender : UIButton){
    let alertController = UIAlertController(title: "Location Based Tasks Not Available", message:
        "Location based tasks are not available just yet. I will add these later!", preferredStyle: UIAlertControllerStyle.alert)
    alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default,handler: nil))
    
    self.present(alertController, animated: true, completion: nil)
    }
}
