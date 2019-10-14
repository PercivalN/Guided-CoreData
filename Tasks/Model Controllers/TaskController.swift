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
	func createTask(with name: String, notes: String, context: NSManagedObjectContext) {

		let task = Task(name: name, notes: notes, context: context)
	}

	// Read

	// Update

	// Delete
}
