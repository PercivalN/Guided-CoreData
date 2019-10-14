//
//  TaskViewController.swift
//  Tasks
//
//  Created by Percy Ngan on 10/14/19.
//  Copyright © 2019 Andrew R Madsen. All rights reserved.
//

import UIKit

class TaskDetailViewController: UIViewController {

	var taskController: TaskController?
	var task: Task?


	@IBOutlet weak var nameTextField: UITextField!
	@IBOutlet weak var notesTextField: UITextView!

	
	override func viewDidLoad() {
        super.viewDidLoad()
		updateViews()
        // Do any additional setup after loading the view.
    }
    

	@IBAction func save(_ sender: Any) {
		// Grab the text from the text views
		if let name = nameTextField.text,
			let notes = notesTextField.text {

			// Either save a new task or update the existing task
			if let task = task {
				taskController?.updateTask(task: task, with: name, notes: notes)
			} else {
				taskController?.createTask(with: name, notes: notes, context: CoreDataStack.shared.mainContext)
			}
		}

	}

	func updateViews() {
		guard isViewLoaded else { return }

		title = task?.name ?? "Create task"
		nameTextField.text = task?.name
		notesTextField.text = task?.notes

	}
	/*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
