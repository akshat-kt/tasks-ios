//
//  TaskViewController.swift
//  Tasks
//
//  Created by Akshat Singh Rathore on 09/07/24.
//

import UIKit

class TaskViewController: UIViewController {
    
    @IBOutlet var label:UILabel!

    var task :String?
    
    var deleteTaskCallback: ((String) -> Void)? = nil
    var editFunc : ((String) -> Void)? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        label.text=task
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Delete", style: .done, target: self, action: #selector(deleteTask))
    }
    
    
    
    @objc func deleteTask(){
        // guard let count = UserDefaults().value(forKey: "count") as? Int else{
        //     return
        // }
        // let newCount = count-1
        // UserDefaults().set(newCount, forKey: "count")
        // UserDefaults().set(nil, forKey: "task_\(count)")
        self.deleteTaskCallback?(task!)
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func didTapEdit(){
        let vc = storyboard?.instantiateViewController(identifier: "entry") as! EntryViewController
        
        vc.title = "Edit Task"
        vc.editTaskCallback = {String in
            self.editFunc?(String)
        }
        
        navigationController?.pushViewController(vc, animated: true)
        
    }


}
