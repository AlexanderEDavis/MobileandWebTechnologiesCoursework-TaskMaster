//
//  FirstViewController.swift
//  Task Master
//
//  Created by Alexander Davis on 12/12/2016.
//  Copyright © 2016 Alexander Davis Computing and Media. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
    
{
    @IBOutlet var tblTasks : UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblTasks.reloadData()
    }
    
    var todoList = [Todo]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadData()
    }
    
    func loadData() {
        self.todoList.removeAll()
        let ref = FIRDatabase.database().reference()
        ref.child("todoList").observeSingleEvent(of: .value, with: { (snapshot) in
            if let todoDict = snapshot.value as? [String:AnyObject] {
                for (_,todoElement) in todoDict {
                    print(todoElement);
                    let todo = Todo()
                    todo.name = todoElement["name"] as? String
                    todo.desc = todoElement["message"] as? String
                    todo.reminderDate = todoElement["date"] as? String
                    self.todoList.append(todo)
                }
            }
      //      self.tableView.reloadData()
            
        }) { (error) in
            print(error.localizedDescription)
        }
        
    }
    
    //MARK: TableView datasource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.todoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell")
        cell!.textLabel?.text = todoList[indexPath.row].name
        return cell!
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return taskMgr.tasks.count
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath){
        
        if (editingStyle == UITableViewCellEditingStyle.delete){
            
            taskMgr.tasks.remove(at: indexPath.row)
            tblTasks.reloadData()
        }
    }
    
}
