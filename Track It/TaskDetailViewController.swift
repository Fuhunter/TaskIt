//
//  TaskDetailViewController.swift
//  Track It
//
//  Created by Niclas Günther on 12.09.14.
//  Copyright (c) 2014 Niclas Günther. All rights reserved.
//

import Foundation

import UIKit

class TaskDetailViewController: UIViewController {
    
    @IBOutlet weak var taskTextField: UITextField!
    @IBOutlet weak var subtaskTextField: UITextField!
    @IBOutlet weak var dueDatePicker: UIDatePicker!
    
    var detailTaskModel: TaskModel!
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        taskTextField.text = detailTaskModel.task;
        subtaskTextField.text = detailTaskModel.subtask;
        dueDatePicker.date = detailTaskModel.date;
    }
}