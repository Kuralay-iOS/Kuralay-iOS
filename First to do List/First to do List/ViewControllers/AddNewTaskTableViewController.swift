//
//  AddNewTaskTableViewController.swift
//  First to do List
//
//  Created by Kuralay Sarsenbayeva on 1/14/21.
//  Copyright © 2021 Kuralay Biehler. All rights reserved.
//

import UIKit

class AddNewTaskTableViewController: UITableViewController {
    
   
   
    
    @IBOutlet weak var titleTextFild: UITextField!
    
    @IBOutlet weak var descriptionTextV: UITextView!
    
    @IBOutlet weak var dataPickerOut: UIDatePicker!

    @IBOutlet weak var sceduleTextField: UITextField!
    
    
    @IBOutlet weak var prioritySwitch: UISwitch!
    
    @IBOutlet weak var favoriteSwitch: UISwitch!
    
    @IBOutlet weak var statusSwitch: UISwitch!
    
    
    @IBOutlet weak var saveEditeButtonOutlet: UIButton!
    
    var dataPicker = [String] ()
    
    var selectDataPic = " "
    
    
    
    var folderIndex : Int?
    var taskIndex: Int?
    
    let getModal = Modal()
    
    var editData : [TasksStruct]?
    
    var openType : String?
    
    
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    
        dataPickerOut.datePickerMode = .date
        
        
        let dataForm = DateFormatter()
        dataForm.dateFormat = "MM - dd - yy"
    
        let myDate = dataForm.date(from: "04 - 01 - 21")!
        dataPickerOut.setDate(myDate, animated: true)
        
        
        
        getModal.loadToDoList()
        footerEmptyView()
        
        if openType == "Edit" {
        
            // Work with
            titleTextFild.text = toDoListData[folderIndex!].tasks[taskIndex!].title
            
           descriptionTextV.text = toDoListData[folderIndex!].tasks[taskIndex!].description
            
          let dataForm = DateFormatter()
          dataForm.dateFormat = "MM - dd- yy"
            
            let defDate = dataForm.date(from: "11 - 12 - 21")!
          
          let getDate = dataForm.date(from: toDoListData[folderIndex!].tasks[taskIndex!].scedule)
            dataPickerOut.setDate(getDate ?? defDate, animated: true)
            
           
            // how to work with DataPicker
            
            dataPickerOut.setDate(getDate ?? dataPickerOut.date, animated: true)
            favoriteSwitch.isOn = toDoListData[folderIndex!].tasks[taskIndex!].favorite
            statusSwitch.isOn = toDoListData[folderIndex!].tasks[taskIndex!].done
            
            if toDoListData[folderIndex!].tasks[taskIndex!].priority != 0 {
                prioritySwitch.isOn = true
            } else {
                prioritySwitch.isOn = false
            }
            
        }
        
    }
    
    
    @IBAction func dataPickerAction(_ sender: UIDatePicker) {
       
        
    }

    @IBAction func saveDataAction(_ sender: UIButton) {
        
        if selectDataPic != " " {
            dataPicker.append(selectDataPic)
            print(dataPicker)
        }
        
        print("TAP SAVE")
        
    
       // navigationController?.popViewController(animated: true)
        
    
        
    }
    
    @IBAction func saveEditeButtonAction(_ sender: UIButton) {
        
        
       
        
        // to add alertController
        
        
          let dataForm = DateFormatter()
              dataForm.dateFormat = "dd - MM - yy"
          
              
        
        var priority = 2
        if prioritySwitch.isOn {
            priority = 1
        } else {
            priority = 2
            
        }
        
        //
        
        if titleTextFild.text?.count != 0 && descriptionTextV.text.count != 0 {
            
            
            if let typeController = openType {
            
                if typeController == "add" {
                
                
                    toDoListData[folderIndex!].tasks.append(
                TasksStruct(title: titleTextFild.text ?? "",
                            description: descriptionTextV.text,
                            scedule: dataForm.string(from: dataPickerOut.date),
                           // dateStructure: dataPickerOut.date,
                            priority: priority,
                            done: statusSwitch.isOn,
                            favorite: favoriteSwitch.isOn)
                )
            }
                else {
                    // examples with hide first !
                    
                    if let checkFolderIndex = folderIndex, let checkTaskIndex = taskIndex {
                        toDoListData[checkFolderIndex].tasks[checkTaskIndex].description = descriptionTextV.text
                        
                        toDoListData[checkFolderIndex].tasks[checkTaskIndex].title = titleTextFild.text!
                 
                        toDoListData[checkFolderIndex].tasks[checkTaskIndex].scedule = dataForm.string(from: dataPickerOut.date)
                        
                  
                    if prioritySwitch.isOn == true {
                        toDoListData[checkFolderIndex].tasks[checkTaskIndex].priority = 1
                    } else {
                        toDoListData[checkFolderIndex].tasks[checkTaskIndex].priority = 0
                        
                    }
                }
                    
                    
                    
                    
                        
                        toDoListData[folderIndex!].tasks[taskIndex!].done = statusSwitch.isOn
                    toDoListData[folderIndex!].tasks[taskIndex!].favorite = favoriteSwitch.isOn
                    
   
                }
        }
                
                
            getModal.saveToDoList()
            
            navigationController?.popViewController(animated: true)
            
            alertMessage(vc: self, alertTitle: "Successfully Saved", alertMessage: nil)
           
        }
        
        
         
        if titleTextFild.text?.count == 0 {
            self.title = "Title is empty"
        }
            
        if descriptionTextV.text.count == 0 {
            self.title = "Description is empty"
            }
        
        if sceduleTextField.text?.count == 0 {
            self.title = "Scedule is empty"
        }
                    
 
}
    
    
    
    func footerEmptyView() {
        
        let myView = UIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 0))
        tableView.tableFooterView = myView
        
        
        
    }
    
    

    }

    
