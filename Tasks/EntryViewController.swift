//
//  EntryViewController.swift
//  Tasks
//
//  Created by Akshat Singh Rathore on 09/07/24.
//

import UIKit

class EntryViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var field: UITextField!
    
    var currentTask : String? = nil
    
    var addTaskCallback: ((String) -> Void)? = nil
    
    var editTaskCallback : ((String) -> Void)? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        field.delegate = self
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(saveTask))

        // Do any additional setup after loading the view.
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        saveTask()
        
        return true
    }
    
    @objc func saveTask(){
        
        guard let text = field.text, !text.isEmpty else {
            return
        }
        // TAKE TEXT FROM TEXT FIELD

        // guard let count = UserDefaults().value(forKey: "count") as? Int else{
        //     return
        // }
        
        // let newCount = count + 1
        
        // UserDefaults().set(newCount, forKey: "count")
        // UserDefaults().set(text, forKey: "task_\(newCount)")
        
        // PASS IT TO CALLBACK.... PASSING STRING TO CALLBACK. OF TYPE ((STRING) -> VOID)?
        
        if title == "Edit Task"{
            editTaskCallback?(text)
        }else{
            addTaskCallback?(text)
        }
        
        navigationController?.popViewController(animated: true)
        navigationController?.popViewController(animated: true)
        
    }
    
    
    
    

}
