//
//  ViewController.swift
//  Track It
//
//  Created by Niclas Günther on 12.09.14.
//  Copyright (c) 2014 Niclas Günther. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var taskArray:[TaskModel] = [];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let date1 = Date.from(year: 2014, month: 03, day: 12);
        let date2 = Date.from(year: 2014, month: 10, day: 10);
        let date3 = Date.from(year: 2014, month: 09, day: 30);
        
        let task1:TaskModel = TaskModel(task: "Study French", subtask: "Verbs", date: date1);
        let task2:TaskModel = TaskModel(task: "Eat Dinner", subtask: "Burgers", date: date2);
        let task3:TaskModel = TaskModel(task: "Gym", subtask: "Leg day", date: date3);
        taskArray = [task1, task2, task3];
        
        tableView.reloadData();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "showTaskDetail" {
            
            let detailVC:TaskDetailViewController = segue.destinationViewController as TaskDetailViewController
            let indexPath = self.tableView.indexPathForSelectedRow();
            let thisTask = taskArray[indexPath!.row];
            detailVC.detailTaskModel = thisTask;

        }
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell:TaskCell = tableView.dequeueReusableCellWithIdentifier("myCell") as TaskCell;
        
        let thisTask = taskArray[indexPath.row];
        
        cell.taskLabel.text = thisTask.task;
        cell.descriptionLabel.text = thisTask.subtask;
        cell.dateLabel.text = Date.toString(date: thisTask.date);
        
        return cell;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return taskArray.count;
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("showTaskDetail", sender: self);
    }
    
}

