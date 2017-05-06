//
//  SecondViewController.swift
//  Task Master
//
//  Created by Alexander Davis on 12/12/2016.
//  Copyright © 2016 Alexander Davis Computing and Media. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class NewTask: UIViewController, UITextFieldDelegate {
    
    var todo:Todo?

    @IBOutlet weak var nametbx: UITextField!
    @IBOutlet weak var descriptiontbx: UITextField!
    @IBOutlet weak var deadlinedpr: UIDatePicker!
    
    @IBAction func donebtn(_ sender: UIBarButtonItem) {
        if todo == nil {
            todo = Todo()
        }
        
        // first section
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy hh:mm a"
        
        todo?.name = self.nametbx.text
        todo?.desc = self.descriptiontbx.text
        todo?.reminderDate = dateFormatter.string(from: self.deadlinedpr.date)
        
        //second section
        let ref = FIRDatabase.database().reference()
        let key = ref.child("todoList").childByAutoId().key
        
        let dictionaryTodo = [ "name"    : todo!.name! ,
                               "description" : todo!.desc!,
                               "date"    : todo!.reminderDate!]
        
        let childUpdates = ["/todoList/\(key)": dictionaryTodo]
        ref.updateChildValues(childUpdates, withCompletionBlock: { (error, ref) -> Void in
            self.navigationController?.popViewController(animated: true)
        })
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
