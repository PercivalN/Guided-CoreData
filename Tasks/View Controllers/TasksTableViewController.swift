//
//  TasksTableViewController.swift
//  Tasks
//
//  Created by Percy Ngan on 10/14/19.
//  Copyright © 2019 Andrew R Madsen. All rights reserved.
//

import UIKit
import CoreData

class TasksTableViewController: UITableViewController {

	var taskController = TaskController()

	// NOTE! This is not a good, efficient way to do this, as the fetch request
	// will be executed every time the tasks property is accessed. We will
	// learn a better way to do this later.
	// Creating a not so good fetch request
	var task: [Task] {

		let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()

		let moc = CoreDataStack.shared.mainContext

		do {
			let tasks = try moc.fetch(fetchRequest)
			return tasks
		} catch {
			NSLog("Error fetching tasks: \(error)")
			return []
		}
	}

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)

		tableView.
	}

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tasks.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...
		cell.textLabel.text = tasks[indexPath.row].name
        return cell
    }



	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "ShowTaskDetail" {
			if let detailVC = segue.destination as? TaskDetailViewController,
				let indexPath = tableView.indexPathForSelectedRow {

				detailVC.task = tasks[indexPath.row]
				detailVC.taskController = taskController
			}
		}
	}

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}
