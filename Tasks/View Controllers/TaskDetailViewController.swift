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
	@IBOutlet weak var prioritySegmentedControl: UISegmentedControl!
	
	override func viewDidLoad() {
        super.viewDidLoad()
		updateViews()
        // Do any additional setup after loading the view.
    }

	@IBAction func save(_ sender: Any) {
		// Grab the text from the text views
		if let name = nameTextField.text,
			let notes = notesTextField.text {

			let index = prioritySegmentedControl.selectedSegmentIndex

			// Use the index to get a task priority
			let priority: TaskPriority

			switch index {
			case 0:
				priority = .low
			case 1:
				priority = .normal
			case 2:
				priority = .high
			default:
				priority = .critical
			}

//			let priority2 = TaskPriority.allCases[index]

			// pass it into the create and updateTask functions below

			// Either save a new task or update the existing task
			if let task = task {
				taskController?.updateTask(task: task, with: name, notes: notes, priority: priority)
			} else {
				taskController?.createTask(with: name, notes: notes, priority: priority, context: CoreDataStack.shared.mainContext)
			}
		}

		navigationController?.popViewController(animated: true)
	}

	func updateViews() {
		guard isViewLoaded else { return }

		title = task?.name ?? "Create task"
		nameTextField.text = task?.name
		notesTextField.text = task?.notes

	}
}
