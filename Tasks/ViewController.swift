//
//  ViewController.swift
//  Tasks
//
//  Created by Akshat Singh Rathore on 08/07/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var tableView : UITableView!
    var allTasks = [String]()
    
    func addTask(_ task: String) {
        allTasks.append(task)
        tableView.reloadData();
    }
    
    func editTask(_ target: String, with newString: String) -> Bool {
        if let index = allTasks.firstIndex(of: target) {
            allTasks[index] = newString
            tableView.reloadData();
        }
        return true
    }

    func deleteTask(_ task: String) {
        // allTasks.append(task)
        // DELETE from allTasks
        allTasks.removeAll {task == $0}
        tableView.reloadData();
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Tasks"
        
        tableView.delegate = self
        tableView.dataSource = self
        
        //setup
        
        // if !UserDefaults().bool(forKey: "setup"){
        //     UserDefaults().set(true, forKey: "setup")
        //     UserDefaults().set(0, forKey: "count")
        // }
        // updateTasks()
    }
    
    func updateTasks(){
        // guard let count = UserDefaults().value(forKey: "count") as? Int else{
        //     return
        // }
        
        // tasks = []
        
        // for x in 0..<count{
        //     if let task = UserDefaults().value(forKey: "task_\(x+1)") as? String{
        //         tasks.append(task)
        //     }
        // }
        
        // tableView.reloadData()
    }
    
    @IBAction func didTapAdd(){
        // EK TAREEKA HOTA HAI, TO CREATE INSTANCE OF A VIEWCONTROLLER USING STORYBOARD KA IDENTIFIER. 
        let vc = storyboard?.instantiateViewController(identifier: "entry") as! EntryViewController

        vc.title = "New Task"
        
        

        vc.addTaskCallback = { task in 
            self.addTask(task);
            // DispatchQueue.main.async {
            //     self.updateTasks()
            // }
        }
        navigationController?.pushViewController(vc, animated: true)
    }
        
    
    


}

extension ViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let vc = storyboard?.instantiateViewController(identifier: "task") as! TaskViewController
        vc.title = "Your Task"

        // PASSING TASK TO VC.
        vc.task = allTasks[indexPath.row]
        

        //TODO --> PASS TASK DELETE CALLBACK TO VC, JISME YOU DELETE THE TASK HERE.
        // ...
        
        vc.editFunc = { newString in
            self.editTask(self.allTasks[indexPath.row], with:newString)
        }
        
        vc.deleteTaskCallback = { task in
            self.deleteTask(task)
        }

        navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension ViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allTasks.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = allTasks[indexPath.row]
        return cell
    }
}
