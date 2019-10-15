//
//  TaskController.swift
//  Tasks
//
//  Created by Percy Ngan on 10/14/19.
//  Copyright © 2019 Andrew R Madsen. All rights reserved.
//

import Foundation
import CoreData

class TaskController {

	// CRUD - Create, Read, Update, Delete

	// Create
	func createTask(with name: String, notes: String,
					priority: TaskPriority,	context: NSManagedObjectContext) {
		Task(name: name, notes: notes,
			priority: priority, context: context)
		// Saves everything to the persistent store
		CoreDataStack.shared.saveToPersistentStore()
	}

	// Read

	// Update
	func updateTask(task: Task, with name: String, notes: String, priority: TaskPriority) {
		task.name = name
		task.notes = notes
		task.priority = priority.rawValue
		CoreDataStack.shared.saveToPersistentStore()
	}

	// Delete
}
