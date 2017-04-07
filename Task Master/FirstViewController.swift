//
//  FirstViewController.swift
//  Task Master
//
//  Created by Alexander Davis on 12/12/2016.
//  Copyright © 2016 Alexander Davis Computing and Media. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
    
{
    @IBOutlet var tblTasks : UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblTasks.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tblTasks.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return taskMgr.tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "Default Tasks")
        
        //Assign the contents of var "items" to the textLabel of each cell
        cell.textLabel!.text = taskMgr.tasks[indexPath.row].name
        cell.detailTextLabel!.text = taskMgr.tasks[indexPath.row].desc
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath){
        
        if (editingStyle == UITableViewCellEditingStyle.delete){
            
            taskMgr.tasks.remove(at: indexPath.row)
            tblTasks.reloadData()
        }
    }
    
}
