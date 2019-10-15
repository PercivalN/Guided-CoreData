//
//  Task+Convenience.swift
//  Tasks
//
//  Created by Percy Ngan on 10/14/19.
//  Copyright © 2019 Andrew R Madsen. All rights reserved.
//

import Foundation
import CoreData

enum TaskPriority: String, CaseIterable{
	case low
	case normal
	case high
	case critical
}

extension Task {

	// This initializer sets up the Core Data (NSManagedObject) part of the Task, then gives it the properties unique to a Task entity
<<<<<<< Updated upstream
	 @discardableResult convenience init(name: String, notes: String,
										 priority: TaskPriority, context: NSManagedObjectContext) {
=======
	 @discardableResult convenience init(name: String, notes: String, context: NSManagedObjectContext) {
>>>>>>> Stashed changes

		// Setup NSManagedObject
		// Calling the designated initializer 
		self.init(context: context)

		self.name = name
		self.notes = notes
		self.priority = priority.rawValue // Have to use raw value because priority is a string
	}
}
