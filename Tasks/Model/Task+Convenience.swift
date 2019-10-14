//
//  Task+Convenience.swift
//  Tasks
//
//  Created by Percy Ngan on 10/14/19.
//  Copyright © 2019 Andrew R Madsen. All rights reserved.
//

import Foundation
import CoreData

extension Task {

	// This initializer sets up the Core Data (NSManagedObject) part of the Task, then gives it the properties unique to a Task entity
	 @ discardableResult convenience init(name: String, notes: String, context: NSManagedObjectContext) {

		// Setup NSManagedObject
		// Calling the designated initializer 
		self.init(context: context)

		self.name = name
		self.notes = notes

	}
}
